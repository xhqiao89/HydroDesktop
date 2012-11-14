﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;

namespace Search3.Keywords
{
    public static class HdSearchOntologyHelper
    {
        //todo: Copied from Search2. Need to be refactored.

        private static readonly string _ontologyFilename = Properties.Settings.Default.OntologyFilename;
        private static readonly string _ontologySynonymsFilename = Properties.Settings.Default.SynonymsFilename;

        public static XmlDocument ReadOntologyXmlFile()
        {
            return ReadXmlFile(_ontologyFilename);
        }

        public static XmlDocument ReadOntologySynonymsXmlFile()
        {
            return ReadXmlFile(_ontologySynonymsFilename);
        }

        private static XmlDocument ReadXmlFile(string filename)
        {
            var tmpxmldoc = new XmlDocument();
            string assemblyFolder = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            tmpxmldoc.Load(Path.Combine(assemblyFolder, filename));
            return tmpxmldoc;
        }

        #region Ontology Utilities

        /* for refatoring
         * we need a set of test cases
         * top level terms that should return empty string
         * couple of leaf nodes, should be return the same
         * terms that are under, and only the top level should be retained
         * disjount terms, that should be returned
         * disjoint terms with a term or two under
         * 
         * Note this is a good method to test (Tim good job). 
         * We could make a small sample ontology xml file to represent a subset of 
         * ontology and make a very small set of controlled use cases
         * */

        /// <summary>
        /// Modifies the input keyword list by removing redundant or otherwise unnecessary items for efficient searching.
        /// </summary>
        /// <param name="KeywordList">List of input keywords to refine.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        public static void RefineKeywordList(List<string> KeywordList, XmlDocument OntologyXml)
        {
            // Refactoring. This is the entry point
            // If searching 1st tier keywords, clear the list.
            var tier1Keywords = GetKeywordsAtTier(1, OntologyXml);
            if (tier1Keywords.Any(KeywordList.Contains))
            {
                KeywordList.Clear();
                return;
            }

            // Remove repeated keywords.
            List<string> tmpList = KeywordList.Distinct().ToList();
            if (tmpList.Count != KeywordList.Count)
            {
                KeywordList.Clear();
                KeywordList.AddRange(tmpList);
            }

            // Remove keywords that don't have a match in the ontology.
            RemoveUnmatchedKeywords(KeywordList, OntologyXml);

            // Remove keywords if their ancestors are also in the list.
            RemoveRedundantChildKeywords(KeywordList, OntologyXml);

            // Replace 2nd tier keywords with their 3rd tier child keywords.
            // 2nd tier keywords cannot be searched at HIS Central.
            IEnumerable<string> tier2Keywords = GetKeywordsAtTier(2, OntologyXml);
            foreach (string tier2keyword in tier2Keywords)
            {
                if (KeywordList.Contains(tier2keyword))
                {
                    // Remove 2nd tier keyword
                    RemoveAllFromList(KeywordList, tier2keyword);

                    // Add 3rd tier keywords that are children of the removed 2nd tier keyword.
                    var tier3Keywords = GetChildKeywords(tier2keyword, OntologyXml);
                    foreach (var tier3keyword in tier3Keywords.Where(tier3keyword => KeywordList.Contains(tier3keyword) == false))
                    {
                        KeywordList.Add(tier3keyword);
                    }
                }
            }
        }

        /// <summary>
        /// Gets all child keywords for the given keyword from the ontology XML.
        /// </summary>
        /// <param name="Keyword">The keyword for which child keywords are sought.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        /// <returns>List of child keywords for the given keyword from the ontology XML.</returns>
        private static IEnumerable<string> GetChildKeywords(string Keyword, XmlDocument OntologyXml)
        {
            // Create a namespace manager to enable XPath searching.  Otherwise, no results are returned if a namespace is present.
            // This works even if no namespace is present.
            var nsmgr = new XmlNamespaceManager(OntologyXml.NameTable);
            nsmgr.AddNamespace("x", OntologyXml.DocumentElement.NamespaceURI);

            // Create an XPath expression to find all child keywords of the given keyword.
            string xpathExpression = "//x:OntologyNode[x:keyword='" + Keyword +
                                     "']/x:childNodes/x:OntologyNode/x:keyword";

            // Select all nodes that match the XPath expression.
            var keywordNodes = OntologyXml.SelectNodes(xpathExpression, nsmgr);

            // Return a list of the parent keywords.
            return NodeListToStringList(keywordNodes);
        }

        /// <summary>
        /// Gets keywords at a given tier within the hierarchical CUAHSI hydrologic ontology.
        /// </summary>
        /// <param name="Tier">The tier for which keywords are sought. The highlest level is tier 1, the next level is tier 2, and so on.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        /// <returns>List of keywords at the given tier in the ontology XML.</returns>
        private static IEnumerable<string> GetKeywordsAtTier(int Tier, XmlDocument OntologyXml)
        {
            // Validate inputs.
            if (Tier < 1)
            {
                throw new ArgumentOutOfRangeException("Tier", "Tier must be greater than or equal to 1");
            }

            // Create a namespace manager to enable XPath searching.  Otherwise, no results are returned if a namespace is present.
            // This works even if no namespace is present.
            var nsmgr = new XmlNamespaceManager(OntologyXml.NameTable);
            nsmgr.AddNamespace("x", OntologyXml.DocumentElement.NamespaceURI);

            // Create an XPath expression to find all keywords at the given tier.
            var expressionBuilder = new StringBuilder(Tier*25);
            for (int i = 2; i <= Tier; i++)
            {
                expressionBuilder.Append("/x:OntologyNode/x:childNodes");
            }
            expressionBuilder.Append("/x:OntologyNode/x:keyword");
            string xpathExpression = expressionBuilder.ToString();

            // Select all nodes that match the XPath expression.
            XmlNodeList keywordNodes = OntologyXml.SelectNodes(xpathExpression, nsmgr);

            // Return a list of the keywords.
            return NodeListToStringList(keywordNodes);
        }

        /// <summary>
        /// Gets all ancestor keywords (parent, grandparent, etc.) for the given keyword from the ontology XML.
        /// </summary>
        /// <param name="Keyword">The keyword for which ancestor keywords are sought.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        /// <returns>List of ancestor keywords for the given keyword from the ontology XML.</returns>
        private static IEnumerable<string> GetAncestorKeywords(string Keyword, XmlDocument OntologyXml)
        {
            // Create a namespace manager to enable XPath searching.  Otherwise, no results are returned if a namespace is present.
            // This works even if no namespace is present.
            var nsmgr = new XmlNamespaceManager(OntologyXml.NameTable);
            nsmgr.AddNamespace("x", OntologyXml.DocumentElement.NamespaceURI);

            // Create an XPath expression to find all parent keywords of the given keyword.
            string xpathExpression = "//x:OntologyNode[x:keyword='" + Keyword + "']/ancestor::x:OntologyNode/x:keyword";

            // Select all nodes that match the XPath expression.
            XmlNodeList keywordNodes = OntologyXml.SelectNodes(xpathExpression, nsmgr);

            // Return a list of the keywords.
            return NodeListToStringList(keywordNodes);
        }

        /// <summary>
        /// Gets keyword nodes from the CUAHSI hydrologic ontology XML that match the given keyword.
        /// </summary>
        /// <param name="Keyword">The keyword for which keyword nodes are sought.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        /// <returns>Keyword nodes from the CUAHSI hydrologic ontology XML that match the given keyword.</returns>
        private static XmlNodeList GetKeywordNodes(string Keyword, XmlDocument OntologyXml)
        {
            // Create a namespace manager to enable XPath searching.  Otherwise, no results are returned if a namespace is present.
            // This works even if no namespace is present.
            var nsmgr = new XmlNamespaceManager(OntologyXml.NameTable);
            nsmgr.AddNamespace("x", OntologyXml.DocumentElement.NamespaceURI);

            // Create an XPath expression to find the given keyword.
            string xpathExpression = "//x:keyword[. = '" + Keyword + "']";

            // Select all nodes that match the XPath expression.
            return OntologyXml.SelectNodes(xpathExpression, nsmgr);
        }

        /// <summary>
        /// Modifies the input list by removing items whose ancestors from the Ontology XML also appear in the list.
        /// </summary>
        /// <param name="KeywordList">List of keywords for which redundant child keywords should be removed.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        private static void RemoveRedundantChildKeywords(List<string> KeywordList, XmlDocument OntologyXml)
        {
            // Find parents for each keyword.  If parent also exists in the keyword list, mark the keyword for removal.
            var keywordsToRemove = new List<string>();
            foreach (string keyword in KeywordList)
            {
                var parentKeywords = GetAncestorKeywords(keyword, OntologyXml);
                if (parentKeywords.Intersect(KeywordList).Any())
                {
                    keywordsToRemove.Add(keyword);
                }
            }

            // Remove unnecessary keywords.
            foreach (var keywordToRemove in keywordsToRemove)
            {
                RemoveAllFromList(KeywordList, keywordToRemove);
            }
        }

        /// <summary>
        /// Modifies the input list by removing keywords that do not appear in the CUAHSI hydrologic Ontology.
        /// </summary>
        /// <param name="KeywordList">List of keywords for which redundant child keywords should be removed.</param>
        /// <param name="OntologyXml">XML of the CUAHSI hydrologic ontology.</param>
        private static void RemoveUnmatchedKeywords(List<string> KeywordList, XmlDocument OntologyXml)
        {
            // Find keywords with no match in the ontology.
            var keywordsToRemove = new List<string>();
            foreach (string keyword in KeywordList)
            {
                var matchingNodes = GetKeywordNodes(keyword, OntologyXml);
                if (matchingNodes.Count == 0)
                {
                    keywordsToRemove.Add(keyword);
                }
            }

            // Remove unmatched keywords.
            foreach (string keywordToRemove in keywordsToRemove)
            {
                RemoveAllFromList(KeywordList, keywordToRemove);
            }
        }

        /// <summary>
        /// Removes all occurrences of a specific string from the System.Collections.Generic.List.
        /// </summary>
        /// <param name="StringList">System.Collections.Generic.List of strings</param>
        /// <param name="Item">The item to remove from the list</param>
        private static void RemoveAllFromList(List<string> StringList, string Item)
        {
            while (StringList.Contains(Item))
            {
                StringList.Remove(Item);
            }
        }

        /// <summary>
        /// Creates a list of InnerText values from the input XML node list.
        /// </summary>
        /// <param name="NodeList">XML node list whose InnerText values will be added to a string list.</param>
        /// <returns>String list of InnerText values from the input XML list.</returns>
        private static IEnumerable<string> NodeListToStringList(XmlNodeList NodeList)
        {
            return (from XmlNode node in NodeList select node.InnerText).ToList();
        }

        #endregion
    }
}
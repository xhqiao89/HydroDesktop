﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.235
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HydroDesktop.Search.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("getOntologyTree.xml")]
        public string ontologyFilename {
            get {
                return ((string)(this["ontologyFilename"]));
            }
            set {
                this["ontologyFilename"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Synonyms.xml")]
        public string synonymsFilename {
            get {
                return ((string)(this["synonymsFilename"]));
            }
            set {
                this["synonymsFilename"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("120")]
        public int WebServiceListUpdateInMinutes {
            get {
                return ((int)(this["WebServiceListUpdateInMinutes"]));
            }
            set {
                this["WebServiceListUpdateInMinutes"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("searchresult.shp")]
        public string SearchResultName {
            get {
                return ((string)(this["SearchResultName"]));
            }
            set {
                this["SearchResultName"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("HIS Central")]
        public string SearchMethod_HISCentral {
            get {
                return ((string)(this["SearchMethod_HISCentral"]));
            }
            set {
                this["SearchMethod_HISCentral"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Local Metadata Cache")]
        public string SearchMethod_MetadataCache {
            get {
                return ((string)(this["SearchMethod_MetadataCache"]));
            }
            set {
                this["SearchMethod_MetadataCache"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("WebServices.xml")]
        public string WebServicesFileName {
            get {
                return ((string)(this["WebServicesFileName"]));
            }
            set {
                this["WebServicesFileName"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("searchresult_{0}.shp")]
        public string SearchResultNameMask {
            get {
                return ((string)(this["SearchResultNameMask"]));
            }
            set {
                this["SearchResultNameMask"] = value;
            }
        }
    }
}
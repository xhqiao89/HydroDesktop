; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; NEEDS QUERY START PACK
;; http://www.jrsoftware.org/isdl.php

;[ISSI]
;;#define Debug

;; define some version parameters
;; from http://stackoverflow.com/questions/357803/automated-build-version-number-with-wix-inno-setup-and-vs2008
;; or maybe http://agiletracksoftware.com/blog.html?id=4
#define AppName "HydroDesktop"
#define SrcApp "HydroDesktop.exe"
#define FileVerStr GetFileVersion(SrcApp)
;#define StripBuild(str VerStr) Copy(VerStr, 1, RPos(".", VerStr)-1)
#define StripBuild(VerStr) Copy(VerStr, 1, RPos(".", VerStr)-1)
#define AppVerStr StripBuild(FileVerStr)
;#define MyAppPublisher "CUAHSI"
;#define MyAppURL "http://www.hydrodesktop.org"
;#define MyAppExeName "MapWindow.exe"
;#define MyAppVerName "0.9"
;#define MyOutputBaseFilename "HydroDesktop09_Installer"

;;"MapWindowx86-installer"
;;"MapWindowx86Full-v48RC1-installer"

;; Include ALL languages
;#define ISSI_Languages

;; Create an About button in the Setup Wizard
;#define ISSI_About  "{cm:issiAbout}"
;; Set date-time format and seperator
;#define ISSI_Constants "YYMDHMS"
;#define ISSI_ConstantsSeperator "."
;; Create a print button on the License page
;#define ISSI_LicensePrint
; Add BeveledLabel message (leave empty for default "Inno Setup" value)
;#define ISSI_BeveledLabel "HydroDesktop"
;; Create a link to a web page in the Setup Wizard using multilingual custom messages:
;#define ISSI_URL
;#define ISSI_UrlText

;; ISSI Languages with license file
;#define ISSI_Dutch "C:\ISSI\license.txt"

; Include ISSI
;#define ISSI_IncludePath "Source\..\..\ISSI"
;#include ISSI_IncludePath+"\_issi.isi"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B3FF6BFE-3E8A-4acb-AD61-5C4304FD754B}
PrivilegesRequired=poweruser
MinVersion=,5.01

; Necessary setting for the 64bit version
ArchitecturesInstallIn64BitMode="x64 ia64"

;
AppName={#AppName}
AppVersion={#AppVerStr}
AppVerName={#AppName} {#AppVerStr}
UninstallDisplayName={#AppName} {#AppVerStr}
VersionInfoVersion={#FileVerStr}
VersionInfoTextVersion={#AppVerStr}
;OutputBaseFilename=MyApp-{#FileVerStr}-setup
AppPublisher="CUAHSI"
AppPublisherURL="www.cuahsi.org"
AppSupportURL="www.hydrodesktop.org"
AppUpdatesURL="www.hydrodesktop.org"
AppCopyright=Copyright � CUAHSI 2009-2011

AppContact="www.hydrodesktop.org"

VersionInfoCompany=CUAHSI [www.cuahsi.org]
VersionInfoCopyright=Mozilla Public License (MPL) 1.1
VersionInfoDescription=HydroDesktop [www.HydroDesktop.org]
VersionInfoProductName="{#AppName} {#AppVerStr}
VersionInfoProductVersion={#AppVerStr}

DefaultDirName={pf}\CUAHSI HIS\HydroDesktop
DefaultGroupName=CUAHSI HIS\HydroDesktop
;If this is set to auto, at startup Setup will look in the registry
;to see if the same application is already installed, and if so, it
;will not show the Select Start Menu Folder wizard page.
DisableProgramGroupPage=false
AllowNoIcons=true
AlwaysShowComponentsList=false
;LicenseFile=Source\App\license.rtf
;InfoBeforeFile=Source\..\..\Documents\Pre-install.txt
;InfoAfterFile=Source\..\..\Documents\Post-install.txt
OutputDir=Releases
OutputBaseFilename="HydroDesktop12_Beta_Installer"
;SetupIconFile=Source\..\..\Documents\MapWindow.ico
;UninstallDisplayIcon=Source\..\..\Documents\MapWindow.ico

ChangesAssociations=true
Compression=lzma/fast
SolidCompression=true
InternalCompressLevel=fast
;WizardImageFile=Source\..\..\Documents\WizImage-MW.bmp
;WizardSmallImageFile=Source\..\..\Documents\WizSmallImage-MW.bmp

;#ifdef Debug
;SetupLogging=true
;#endif

;[Languages]

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\Binaries\HydroDesktop.*"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\DotSpatial.*"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\WeifenLuo.WinFormsUI.Docking.*"; DestDir: "{app}"; Flags: ignoreversion;

Source: "..\Binaries\log4net.*"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\Ionic.Zip.*"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\EurekaLog.*"; DestDir: "{app}"; Flags: ignoreversion;

Source: "..\Binaries\Icons\*"; DestDir: "{app}\Icons"; Flags: ignoreversion;

;Source: "..\Binaries\HydroDesktop.Configuration.*"; DestDir: "{app}";  Flags: ignoreversion;
;Source: "..\Binaries\HydroDesktop.Data.*"; DestDir: "{app}";  Flags: ignoreversion;
;Source: "..\Binaries\HydroDesktop.Help.*"; DestDir: "{app}";  Flags: ignoreversion;
;Source: "..\Binaries\System.Windows.Forms.Ribbon35.*"; DestDir: "{app}";  Flags: ignoreversion;

;Source: "..\Binaries\DotSpatial.Analysis.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Controls.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Compatibility.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Data.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Data.Forms.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Modeling.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Modeling.Forms.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Projections.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Projections.Forms.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Serialization.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Symbology.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Symbology.Forms.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\DotSpatial.Topology.*"; DestDir: "{app}"; Flags: ignoreversion;

;Source: "..\Binaries\nunit.framework.*"; DestDir: "{app}"; Flags: ignoreversion;
;Source: "..\Binaries\nunit.core.*"; DestDir: "{app}"; Flags: ignoreversion;

;Source: "..\Binaries\ZedGraph.*"; DestDir: "{app}"; Flags: ignoreversion;

;Source: "..\Binaries\getOntologyTree.xml"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;
;Source: "..\Binaries\Synonyms.xml"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;
;Source: "..\Binaries\q_save.xml"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;
Source: "..\Binaries\Help\html\*"; DestDir: "{app}\Help\html"; Flags: ignoreversion recursesubdirs;

;Source: "..\Binaries\WebServices.xml"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;

;Source: "..\Binaries\settings.xml"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;
;Source: "default.hdprj"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;
; not yet capable of doing good relative paths from a folder
;Source: "default.hdprj"; DestDir: "{userdocs}\HydroDesktop\default"; Flags: ignoreversion; Permissions: everyone-modify;
;Source: "..\Binaries\projects\default\default.hdprj"; DestDir: "{app}\projects\default"; Flags: ignoreversion; Permissions: everyone-modify;

;Source: "..\Binaries\Source.cur"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;
;Source: "..\Binaries\Target.cur"; DestDir: "{app}"; Flags: ignoreversion; Permissions: everyone-modify;

Source: "..\Binaries\Plugins\EditView\*"; DestDir: "{app}\Plugins\EditView"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\EPADelineation\*"; DestDir: "{app}\Plugins\EPADelineation"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ExportToCSV\*"; DestDir: "{app}\Plugins\ExportToCSV"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\FetchBasemap\*"; DestDir: "{app}\Plugins\FetchBasemap"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\HydroModeler\*"; DestDir: "{app}\Plugins\HydroModeler"; Flags: ignoreversion ;
Source: "..\Binaries\Plugins\HydroR\*"; DestDir: "{app}\Plugins\HydroR"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\MetadataFetcher\*"; DestDir: "{app}\Plugins\MetadataFetcher"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\Search2\*"; DestDir: "{app}\Plugins\Search2"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\TableView\*"; DestDir: "{app}\Plugins\TableView"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\TSA\*"; DestDir: "{app}\Plugins\TSA"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\HelpTab\*"; DestDir: "{app}\Plugins\HelpTab"; Flags: ignoreversion;

;Source: "..\Binaries\Plugins\Search\*"; DestDir: "{app}\Plugins\Search"; Flags: ignoreversion;
;Source: "..\Binaries\Plugins\ImportFromWaterML\*"; DestDir: "{app}\Plugins\ImportFromWaterML"; Flags: ignoreversion;
;Source: "..\Binaries\Plugins\HydroModeler2.0\*"; DestDir: "{app}\Plugins\HydroModeler2.0"; Flags: ignoreversion;
;Source: "..\Binaries\Plugins\Toolbox\*"; DestDir: "{app}\Plugins\Toolbox"; Flags: ignoreversion;
;Source: "..\Binaries\Tools\*"; DestDir: "{app}\Tools"; Flags: ignoreversion;


Source: "..\Binaries\System.Data.SQLite.dll"; DestDir: "{app}"; DestName: "System.Data.SQLite.dll"
;Source: "..\Binaries\System.Data.SQLite.dll"; DestDir: "{app}"; DestName: "System.Data.SQLite.dll"; Check: not Is64BitInstallMode;
;Source: "..\Binaries\System.Data.SQLite64bit.dll"; DestDir: "{app}"; DestName: "System.Data.SQLite.dll"; Check: IsX64;
;Source: "..\Binaries\System.Data.SQLite64bit.dll"; DestDir: "{app}"; DestName: "System.Data.SQLite.dll"; Check: IsIA64;

;Source: "Databases\*"; DestDir: "{app}\Databases"; Permissions: everyone-modify;
Source: "..\Binaries\Maps\*"; DestDir: "{app}\Maps"; Permissions: everyone-modify; Flags: recursesubdirs
;Source: "..\Maps\BaseData-MercatorSphere\*"; DestDir: "{app}\Maps\BaseData"; Permissions: everyone-modify

;Example Configurations for HydroModeler
;Uncomment following line after HydroModeler is ready for V 1.2
Source: "hydromodeler_example_configurations\*"; DestDir: "{app}\Plugins\HydroModeler\hydromodeler_example_configurations"; Permissions: everyone-modify; Flags: recursesubdirs

;Source: "hydromodeler_example_configurations\example_configuration_01"; DestDir: "{app}\Plugins\HydroModeler\hydromodeler_example_configurations\example_configuration_01"; Permissions: everyone-modify
;Source: "hydromodeler_example_configurations\example_configuration_02"; DestDir: "{app}\Plugins\HydroModeler\hydromodeler_example_configurations\example_configuration_02"; Permissions: everyone-modify
;Source: "hydromodeler_example_configurations\example_configuration_03"; DestDir: "{app}\Plugins\HydroModeler\hydromodeler_example_configurations\example_configuration_03"; Permissions: everyone-modify



[Icons]
Name: "{group}\HydroDesktop"; Filename: "{app}\HydroDesktop.exe"
Name: "{group}\{cm:UninstallProgram,HydroDesktop}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\HydroDesktop"; Filename: "{app}\HydroDesktop.exe"; Tasks: desktopicon

[Registry]
Root: HKCR; Subkey: ".dspx"; ValueType: string; ValueName: ""; ValueData: "HD_Project"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "HD_Project"; ValueType: string; ValueName: ""; ValueData: "HydroDesktop Project"; Flags: uninsdeletekey 
Root: HKCR; Subkey: "HD_Project\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\HydroDesktop.exe,0"
Root: HKCR; Subkey: "HD_Project\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\HydroDesktop.exe"" ""%1"""

[Run]
;Start HydroDesktop
Filename: "{app}\HydroDesktop.exe"; Description: "{cm:LaunchProgram,HydroDesktop}"; Flags: nowait postinstall skipifsilent

[InstallDelete]
Type: files; Name: "{app}\DotSpatial.Common.dll"
Type: files; Name: "{app}\DotSpatial.Desktop.dll"
Type: files; Name: "{app}\NDepend.Helpers.FileDirectoryPath.dll"
Type: files; Name: "{app}\FluentNHibernate.dll"
Type: files; Name: "{app}\NHibernate.dll"
Type: files; Name: "{app}\Plugins\Search\search.*"
Type: files; Name: "{app}\Plugins\MetadataFetcher\HIS_Database.*"
Type: files; Name: "{app}\Plugins\DataFetcher\HIS_Database.*"
Type: files; Name: "{app}\Plugins\ImportFromWaterML\ImportFromWaterML.*"
Type: files; Name: "{app}\HydroDesktop.Database.*"
Type: files; Name: "{app}\HydroDesktop.Help.*"
Type: files; Name: "{app}\HydroDesktop.DataModel.*"
Type: files; Name: "{app}\HydroDesktop.WebServices.*"
Type: files; Name: "{app}\FetchBasemap\FetchBasemap.*"
Type: files; Name: "{app}\settings.xml"
Type: files; Name: "{app}\q_save.xml"
Type: files; Name: "{app}\System.Windows.Forms.Ribbon35.dll"

[UninstallDelete]
Type: files; Name: "{app}\DotSpatial.Common.dll"
Type: files; Name: "{app}\DotSpatial.Desktop.dll"
Type: files; Name: "{app}\NDepend.Helpers.FileDirectoryPath.dll"
Type: files; Name: "{app}\FluentNHibernate.dll"
Type: files; Name: "{app}\NHibernate.dll"
Type: files; Name: "{app}\q_save.xml"
;Name: {app}\Sample Projects; Type: filesandordirs; Components:
;Name: {app}; Type: files; Components:
;Name: {app}; Type: dirifempty; Components:

[Dirs]
Name: {app}; Permissions: everyone-modify
Name: {app}\databases; Permissions: everyone-modify
Name: {app}\maps; Permissions: everyone-modify
Name: {app}\projects; Permissions: everyone-modify
Name: {app}\HydroDesktop\default; Permissions: everyone-modify
; not yet capable of moving stuff outside of the HD folder reliably
;Name: {userdocs}\HydroDesktop\default; Permissions: everyone-modify

[Code]
function MsiQueryProductState(ProductCode: string): integer;
external 'MsiQueryProductStateA@msi.dll';

const
  INSTALLSTATE_DEFAULT = 5;
  INSTALLLEVEL_MAXIMUM = $ffff;
  INSTALLSTATE_ABSENT = 2;

function IsDotNET20Detected(): boolean;
var
  NetSuccess: boolean;
  NetInstall: cardinal;
begin
  NetSuccess := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727', 'Install', NetInstall);
  Result := NetSuccess and (NetInstall = 1);

//#ifdef Debug
//  if Result then
//		MsgBox('Found DotNET20', mbInformation, MB_OK);
//#endif

end;

function IsDotNET35Detected(): boolean;
var
  NetSuccess: boolean;
  NetInstall: cardinal;
begin
  NetSuccess := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5', 'Install', NetInstall);
  Result := NetSuccess and (NetInstall = 1);

//#ifdef Debug
//  if Result then
//		MsgBox('Found DotNET35', mbInformation, MB_OK);
//#endif
end;

function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1.4322'     .NET Framework 1.1
//    'v2.0.50727'    .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key: string;
    install, serviceCount: cardinal;
    success: boolean;
begin
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + version;
    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;
    // .NET 4.0 uses value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;
    result := success and (install = 1) and (serviceCount >= service);
end;

function IsDotNet40Detected(): boolean;
begin
  Result := IsDotNetDetected('v4\Client', 0);
end;


function IsMsiProductInstalled(const ProductId: string): boolean;
begin
	Result := MsiQueryProductState(ProductId) = INSTALLSTATE_DEFAULT;
end;

function InstallDotNET(versionDotNET: string; file1: String; file2: String; urlFamilyID: String): Boolean;
var
	ExpectedLocalLocation: String;
	ErrorCode: Integer;
begin
	ExpectedLocalLocation := ExpandConstant('{src}') + '\' + file1;
	if not FileExists(ExpectedLocalLocation) then
		ExpectedLocalLocation := ExpandConstant('{src}') + '\' + file2;

	if FileExists(ExpectedLocalLocation) then
	begin
		ShellExec('open', ExpectedLocalLocation, '', '', SW_SHOW, ewNoWait, ErrorCode);
		Result := MsgBox('Ready to continue HydroDesktop installation?' #13#13 '(Click Yes after installing .Net Framework ' + versionDotNET + ')', mbConfirmation, MB_YESNO) = idYes;
	end
	else
	begin
		if MsgBox('The .Net Framework ' + versionDotNET + ' is required but was not found.' #13#13 'Open the web page for downloading .Net ' + versionDotNET + ' now?', mbConfirmation, MB_YESNO) = idYes	then
		begin
			ShellExec('open', 'http://www.microsoft.com/downloads/details.aspx?FamilyID=' + urlFamilyID, '', '', SW_SHOW, ewNoWait, ErrorCode)
			Result := MsgBox('Ready to continue MapWindow installation?' #13#13 '(Click Yes after installing .Net Framework ' + versionDotNET + ')', mbConfirmation, MB_YESNO) = idYes;
		end
		else
			Result := MsgBox('.Net ' + versionDotNET + ' Framework is required but was not found.' #13#13 'Continue HydroDesktop installation?', mbConfirmation, MB_YESNO) = idYes;
	end;
end;

function CheckDotNetVersions(): Boolean;
begin
  // v2.0
  Result := IsDotNET20Detected();
  if not Result then
  begin
    Result := InstallDotNET('v2.0', 'dotnetfx20.exe', 'dotnetfx_v2.0.exe', '79BC3B77-E02C-4AD3-AACF-A7633F706BA5');
	end;

  // v3.5
  Result := IsDotNET35Detected();
  if not Result then
  begin
    Result := InstallDotNET('v3.5', 'dotnetfx35.exe', 'dotnetfx_v3.5.exe', 'AB99342F-5D1A-413D-8319-81DA479AB0D7');
	end;
  // v4.0
  Result := IsDotNET40Detected();
  if not Result then
  begin
    Result := InstallDotNET('v4.0', 'dotnetfx40.exe', 'dotnetfx_v4.0.exe', '9cfb2d51-5ff4-4491-b0e5-b386f32c0992');
  end;
end;


function InitializeSetup(): Boolean;
var
  //ErrorCode: Integer;
  //ExpectedLocalLocation: String;
  R1: Boolean;
begin
  R1 := True;

  // Check for .NET prerequisites
	Result := CheckDotNetVersions();
end;
	
function IsX64: Boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: Boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function GetURL(x86, x64, ia64: String): String;
begin
	if IsX64() and (x64 <> '') then
		Result := x64;
	if IsIA64() and (ia64 <> '') then
		Result := ia64;
	
	if Result = '' then
		Result := x86;
end;	


//#ifdef Debug
//  #expr SaveToFile(AddBackslash(SourcePath) + "Preprocessed.iss")
//#endif

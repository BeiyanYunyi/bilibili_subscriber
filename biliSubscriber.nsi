; example2.nsi
;
; This script is based on example1.nsi, but it remember the directory, 
; has uninstall support and (optionally) installs start menu shortcuts.
;
; It will install example2.nsi into a directory that the user selects.
;
; See install-shared.nsi for a more robust way of checking for administrator rights.
; See install-per-user.nsi for a file association example.

;--------------------------------
!include MUI2.nsh
; The name of the installer
Name "BiliBili Subscriber"

; The file to write
OutFile "BiliBili Subscriber Installer.exe"

; Request application privileges for Windows Vista and higher
RequestExecutionLevel admin

; Build Unicode installer
Unicode True

; The default installation directory
InstallDir "$PROGRAMFILES64\BiliBili Subscriber"

; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\BiliBili Subscriber" "Install_Dir"

!define MUI_ABORTWARNING

;--------------------------------

; Pages

!insertmacro MUI_PAGE_LICENSE "windows\LICENSE"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"

;--------------------------------

; The stuff to install
Section "BiliBili Subscriber (required)"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r "windows\*"
  
  ; Write the installation path into the registry
  WriteRegStr HKLM "Software\BiliBili Subscriber" "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BiliBili Subscriber" "DisplayName" "BiliBili Subscriber"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BiliBili Subscriber" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BiliBili Subscriber" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BiliBili Subscriber" "NoRepair" 1
  WriteUninstaller "$INSTDIR\uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\BiliBili Subscriber"
  CreateShortcut "$SMPROGRAMS\BiliBili Subscriber\Uninstall.lnk" "$INSTDIR\uninstall.exe"
  CreateShortcut "$SMPROGRAMS\BiliBili Subscriber\BiliBili Subscriber.lnk" "$INSTDIR\bilibili_subscriber.exe"

SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BiliBili Subscriber"
  DeleteRegKey HKLM "SOFTWARE\BiliBili Subscriber"

  ; Remove files and uninstaller
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\BiliBili Subscriber\*.lnk"

  ; Remove directories
  RMDir "$SMPROGRAMS\BiliBili Subscriber"
  RMDir /r "$INSTDIR"

SectionEnd

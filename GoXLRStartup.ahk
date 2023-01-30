;File locations
app := "C:\Program Files (x86)\TC-Helicon\GOXLR\GOXLR App.exe"
controlPanel := "C:\Program Files\TC-Helicon\GoXLR_Audio_Driver\W10_x64\GoXLRAudioCplApp.exe"
settings := A_AppData "\TC-Helicon\GOXLR\GoXLR.settings"

;Profile
startupProfile := "Default"

;Switch lastLoadedProfile to startupProfile
settingsFile := FileRead(settings)
newSettings := RegExReplace(settingsFile,'(<VALUE name="lastLoadedProfile" val=").*(\.goxlr"\/>)', '$1' startupProfile '$2',,1)
FileDelete settings
FileAppend newSettings, settings

;Run GoXLR
Run controlPanel " -hide"
Run app
md dist
cd dist
copy ..\binaries\%PLATFORM%-%CONFIGURATION%\converter.exe .\
copy ..\binaries\%PLATFORM%-%CONFIGURATION%\aiwrapper.exe .\
copy ..\etc\* .\

IF NOT EXIST ..\binaries\%PLATFORM%-%CONFIGURATION%\xrayMayaTools.mll GOTO skip_maya
md maya
copy ..\binaries\%PLATFORM%-%CONFIGURATION%\xrayMayaTools.mll .\maya
copy ..\sources\plugins\maya_tools\MEL\* .\maya
:skip_maya

md docs
copy ..\docs\* .\docs\

md docs\howto
copy ..\docs\howto\* .\docs\howto

md docs\tools
copy ..\docs\tools\* .\docs\tools

7z a xray_re-tools_%APPVEYOR_REPO_TAG_NAME%_%COR_PLAT%.7z *
copy xray_re-tools_%APPVEYOR_REPO_TAG_NAME%_%COR_PLAT%.7z xray_re-tools_latest_%COR_PLAT%.7z
appveyor PushArtifact xray_re-tools_latest_%COR_PLAT%.7z
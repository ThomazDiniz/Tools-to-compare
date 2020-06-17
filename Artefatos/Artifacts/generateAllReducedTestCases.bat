@echo off
setlocal enabledelayedexpansion

::Clearing folders
del /F /Q tgf
del /F /Q tgf\xml
mkdir tgf\xml

echo ====================== Generating tgf's... ======================
for /r %%i in (*.dsl) do (
	java -jar ucdsl-all.jar -f %%~ni%%~xi -t
	echo %%~ni.tgf - OK
)

echo ====================== Generating annotated tgf's... ======================
for /r %%i in (tgf\*.tgf) do (
	java annotateTGFfromDSL tgf\%%~ni
	echo %%~ni-annotated.tgf - OK
)

echo ====================== Generating reduced test cases... ======================
for /r %%i in (tgf\*annotated.tgf) do (
	java -jar lts-btv2.jar reduce_annotated B parameterizedDFS 1 tgf\%%~ni.tgf tgf\xml\%%~ni_reduced.xml
	echo %%~ni_reduced.xml - OK
)

echo ====================== TEST CASE GENERATION FINISHED! ======================





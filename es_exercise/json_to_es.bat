set DIR=D:\ProgramData\elasticsearch-7.10.0\plugins
set LIB="%DIR%\lib\*"
set BIN="%DIR%\bin\*"
"%JAVA_HOME%\bin\java" -cp "%LIB%" -Dlog4j.configurationFile=file://%DIR%\bin\log4j2.xml "org.xbib.tools.Runner" "org.xbib.tools.JDBCImporter" jdbc_oracle.json
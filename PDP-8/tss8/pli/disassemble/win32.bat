rem c:\program files\microsoft visual studio\vcvars32.bat

set MTI_HOME=c:\Modeltech_6.2g

cl -c -I%MTI_HOME%\include -D__MODELSIM__ pli_disassemble.c
link -dll -export:vlog_startup_routines pli_disassemble.obj %MTI_HOME%\win32\mtipli.lib

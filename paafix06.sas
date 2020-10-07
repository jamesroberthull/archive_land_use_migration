*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paafix06.sas
**     Programmer: james r. hull
**     Start Date: 2006 January 04
**     Purpose:
**        1.) Generate contents lists for all current data files
**
**     Input Data:
**        1.) '/trainee/jrhull/paa1996/m03_12_1.xpt';
**        2.) '/trainee/jrhull/paa1996/m13_22_1.xpt';
**        3.) '/trainee/jrhull/paa1996/m03_12_2.xpt';
**        4.) '/trainee/jrhull/paa1996/m13_22_2.xpt';
**        5.) '/trainee/jrhull/paa1996/m03_12_3.xpt';
**        6.) '/trainee/jrhull/paa1996/m13_22_3.xpt';
**        7.) '/trainee/jrhull/paa1996/m03_12_4.xpt';
**        8.) '/trainee/jrhull/paa1996/m13_22_4.xpt';
**        9.) '/trainee/jrhull/paa1996/m03_12_5.xpt';
**        10.) '/trainee/jrhull/paa1996/m13_22_5.xpt';
**
**
**     Output Data:
**
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=55;

title1 'PAA1996: Contents for all current data files';

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/trainee/jrhull/paa1996/m03_12_1.xpt';
libname in2 xport '/trainee/jrhull/paa1996/m13_22_1.xpt';
libname in3 xport '/trainee/jrhull/paa1996/m03_12_2.xpt';
libname in4 xport '/trainee/jrhull/paa1996/m13_22_2.xpt';
libname in5 xport '/trainee/jrhull/paa1996/m03_12_3.xpt';
libname in6 xport '/trainee/jrhull/paa1996/m13_22_3.xpt';
libname in7 xport '/trainee/jrhull/paa1996/m03_12_4.xpt';
libname in8 xport '/trainee/jrhull/paa1996/m13_22_4.xpt';
libname in9 xport '/trainee/jrhull/paa1996/m03_12_5.xpt';
libname in10 xport '/trainee/jrhull/paa1996/m13_22_5.xpt';

proc contents data=in1.m03_12_1;
run;

proc contents data=in3.m03_12_2;
run;

proc contents data=in5.m03_12_3;
run;

proc contents data=in7.m03_12_4;
run;

proc contents data=in9.m03_12_5;
run;

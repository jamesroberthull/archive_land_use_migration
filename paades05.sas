*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paades05.sas
**     Programmer: james r. hull
**     Start Date: 2005 July 1
**     Purpose:
**        1.) Create dependent variable needed to replicate 1996 regression
**            analysis and generate descriptive statistics for all var's
**        2.) Adds variables in file 'spatial' to final file for testing
**     Input Data:
**        1.) /trainee/jrhull/paa1996/miglu02.xpt
**        2.) /trainee/jrhull/paa1996/spatial.xpt
**     Output Data:
**        1.) /trainee/jrhull/paa/miglu03.xpt
**
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=55;

title1 'PAA1996: generates variables and descriptive statistics';

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/trainee/jrhull/paa1996/miglu02.xpt';
libname in2 xport '/trainee/jrhull/paa1996/spatial.xpt';
libname out1 xport '/trainee/jrhull/paa1996/miglu03.xpt';

****************************************************************
**  Create Dependent Variable Migration Status - In/Out/LTFU  **
****************************************************************;

*** Frequencies on two questions needed to create DV ***;

/*proc freq data=in1.miglu02;
     table status mhtype;
run;*/

data work1;
     set in1.miglu02;
run;


/*proc freq data=work1;
     tables status mhtype;
run;*/

data work2;
     merge work1 (in=a)
           in2.spatial (in=b);
     by vill84;

     if STATUS=1 then MIGSTAT=1;
        else if STATUS=2 then MIGSTAT=1;
        else if STATUS=3 then MIGSTAT=2;
        else if STATUS=9 then MIGSTAT=.;
        else if MHTYPE=1 then MIGSTAT=3;
        else if MHTYPE=2 then MIGSTAT=.;
     label MIGSTAT='mig stat 1=in village 2=migrant 3=LTFU';

     if STATUS ^in (0,4);

run;

data out1.miglu03;
     set work2;
run;

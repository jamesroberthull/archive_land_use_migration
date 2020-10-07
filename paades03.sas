*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paades03.sas
**     Programmer: james r. hull
**     Start Date: 2005 March 23
**     Purpose:
**        1.) Create dependent variable needed to replicate 1996 regression
**            analysis and generate descriptive statistics for all var's
**
**     Input Data:
**        1.) /trainee/jrhull/paa/miglu02.xpt
**
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
     set work1;
     if STATUS=1 then MIGSTAT=1;
        else if STATUS=2 then MIGSTAT=1;
        else if STATUS=3 then MIGSTAT=2;
        else if STATUS=9 then MIGSTAT=.;
        else if MHTYPE=1 then MIGSTAT=3;
        else if MHTYPE=2 then MIGSTAT=.;
     label MIGSTAT='mig stat 1=in village 2=migrant 3=LTFU';
     if STATUS ^in (0,4);
run;

*** Contents ***;

proc contents data=work2 varnum;
run;

**************************************
**  General descriptive statistics  **
**************************************;

***  remove labels to make less bulky tables and drop
     cases with missing values on dep. var. migstat   ***;

data work3;
     set work2;
     attrib _all_
         label='';
     if MIGSTAT ne .;
run;

proc freq data=work3;
     tables MIGSTAT /missprint;
run;

proc freq data=work3;
     tables MEMNOIND NUMTMPAB ELECTRIC MALE/missprint;
run;

proc means data=work3 maxdec=2 mean std min max nmiss;
     var AGE MEMNOIND NUMTMPAB G3BPPVIL G3BOLVIL
     G3B: G3D: AGASET84 AGASET_2 VIL_AGE RVIL_AGE RAI;
run;

****************************************
**   Some other descriptive analyses  **
****************************************;

***  Examine the cases originally coded 4 on status  ***;

/*proc sort data=work1 out=work4;
     by status mhtype;
run;

proc freq data=work4;
     by status;
     tables age;
run;*/

***  Generate tables of descriptives by migstat  ***;

proc sort data=work3 out=work5;
     by MIGSTAT;
run;

proc freq data=work5;
     by migstat;
     tables MEMNOIND NUMTMPAB ELECTRIC MALE/missprint;
run;

proc means data=work5 maxdec=2 mean std min max nmiss;
     by migstat;
     var AGE MEMNOIND NUMTMPAB G3BPPVIL G3BOLVIL
     G3B: G3D: AGASET84 AGASET_2 VIL_AGE RVIL_AGE RAI;
run;

data out1.miglu03;
     set work2;
run;

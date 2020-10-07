********************************************************************
**      Program Name: /trainee/jrhull/paa1996/paades01.sas
**      Programmer: james r. hull
**      Start Date: 2005 March 10
**      Purpose:
**        1.) Check the newly created dataset miglu_01 for integrity
**            by comparing it to a random sample of cases from the
**            original datasets that contain its component variables
**      Input Data:
**          1.) /trainee/jrhull/paa1996/miglu01.xpt
**          2.) /nangrong/data_sas/1984/current/hh84.01
**          3.) /nangrong/data_sas/1994/current/indiv94.03
**          4.) /nangrong/data_sas/1984/current/comm84.01
**          5.) /nangrong/data_sas/sacpc/sacpc068.xpt
**          6.) /nangrong/data_sas/1984/current/indiv84.02
**          7.) /nangrong/data_sas/1994/current/moved94.02
**
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=60;

title1 'Program to check integrity of data in miglu01';

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/trainee/jrhull/paa1996/miglu01.xpt';
libname in2 xport '/nangrong/data_sas/1984/current/hh84.01';
libname in3 xport '/nangrong/data_sas/1994/current/indiv94.03';
libname in4 xport '/nangrong/data_sas/1984/current/comm84.01';
libname in5 xport '/nangrong/data_sas/sacpc/sacpc068.xpt';
libname in6 xport '/nangrong/data_sas/1984/current/indiv84.02';
libname in7 xport '/nangrong/data_sas/1994/current/moved94.02';

************************************************************
**  choose a random sample of original cases from hh84    **
**  and cross-check these cases against those in miglu01  **
************************************************************;

data smp5pct1 (keep=vill84 house84 hh84_33 hh84_29 hh84_30 hh84_37-hh84_48);
    set in2.hh84;
    if ranuni(4321) <.05 then output;
run;

data testfile (keep=vill84 house84 hh84_33 hh84_29 hh84_30 hh84_37-hh84_48);
    set in1.miglu01;
run;

proc sort data=testfile out=testfile2 noduprecs;
    by vill84 house84;
run;

data testfile3;
    set testfile2
        smp5pct1;
run;

proc sort data=testfile3 out=testfile4 noduprecs;
    by vill84 house84;
run;


*************************************************************
**  choose a random sample of original cases from indiv94  **
**  and cross-check these cases against those in miglu01   **
*************************************************************;

data smp5pct2 (keep=vill84 house84 cep84 status);
     set in3.indiv94 (keep=vill84 house84 cep84 q1 code2);
     if (code2 ^in(1,5)) and (cep84 ne ' ');
     if ranuni(4321) <.05;
     rename q1=status;
run;

data testfile (keep=vill84 house84 cep84 status);
     set in1.miglu01
     smp5pct2;
run;

proc sort data=testfile out=testfile2 noduprecs;
     by vill84 house84 cep84;
run;

************************************************************
**  choose a random sample of original cases from comm84  **
**  and cross-check these cases against those in miglu01  **
************************************************************;

data smp15pct (keep=vill84 v84_206);
     set in4.comm84 (keep= vill84 v84_206);
     if ranuni (5432) < .15;
run;

data testfile (keep=vill84 v84_206);
     set in1.miglu01;
run;

proc sort data=testfile out=testfile2 noduprecs;
     by vill84;
run;

data testfile3 (keep= vill84 v84_206);
     set testfile2
     smp15pct;
run;

proc sort data=testfile3 out=testfile4 noduprecs;
     by vill84;
run;

**************************************************************
**  choose a random sample of original cases from sacpc068  **
**  and cross-check these cases against those in miglu01    **
**************************************************************;

data smp15pct2;
     set in5.sacpc068;
     if ranuni (5432) < .15;
run;

data testfile (drop= house84 cep84 temp_abs sex age status
     mhtype hh84_29 hh84_30 hh84_33 hh84_37-hh84_48 memnoind
     numtmpab v84_206);
     set in1.miglu01;
run;

proc sort data=testfile out=testfile2 noduprecs;
     by vill84;
run;

data testfile3;
     set testfile2
     smp15pct2;
run;

proc sort data=testfile3 out=testfile4 noduprecs;
     by vill84;
run;

*************************************************************
**  choose a random sample of original cases from indiv84  **
**  and cross-check these cases against those in miglu01   **
*************************************************************;

data smp5pct3;
     set in6.indiv84 (keep=vill84 house84 cep84 in84_06);
     by vill84 house84;

     keep vill84 house84 mem3to22 numtmpab;

     retain mem3to22 numtmpab;

     if first.house84 then do;
                             mem3to22=0;
                             numtmpab=0;
                           end;
     if (3 <= in84_06 <= 22) then mem3to22=mem3to22+1;

     if (cep84 >'200') then numtmpab=numtmpab+1;

     if last.house84 and (ranuni(6543) <.05) then output;
run;

data smp5pct4 (keep=vill84 house84 memnoind numtmpab);
     set smp5pct3;
     if (mem3to22 >0) then memnoind=mem3to22-1;
        else memnoind=0;
run;

data testfile (keep=vill84 house84 memnoind numtmpab);
     set in1.miglu01;
run;

proc sort data=testfile out=testfile2 noduprecs;
     by vill84 house84;
run;

data testfile3;
     set testfile2
     smp5pct4;
run;

proc sort data=testfile3 out=testfile4 noduprecs;
     by vill84 house84;
run;

*****************************************************
**  Still need to think of a way to check moved94  **
*****************************************************;

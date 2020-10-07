***************************************
*  Checking Jim Hull's PAA96 Program  *
***************************************;

********************************************************************
**      Program Name: /trainee/jrhull/paa1996/paamer01.sas
**      Programmer: james r. hull
**      Start Date: 2004 October 21
**      Purpose:
**          Create dataset for Re-write of PAA96 paper:
**          1.) Create multiple datasets based individuals
**              in the 1984 dataset from various existing sources
**          2.) Output datafiles needed to validate merges
**          3.) Merge the multiple datasets into a single dataset
**      Input Data:
**          1.) /nangrong/data_sas/1984/current/indiv84.02
**          2.) /nangrong/data_sas/1994/current/indiv94.03
**          3.) /nangrong/data_sas/1994/current/moved94.02
**          4.) /nangrong/data_sas/1984/current/hh84.01
**          5.) /nangrong/data_sas/1984/current/comm84.01
**          6.) /nangrong/data_sas/sacpc/sacpc068.xpt
**
**      Output Data:
**          1.) /trainee/jrhull/paa1996/miglu01.xpt
**
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=60;

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/nangrong/data_sas/1984/current/indiv84.02';
libname in2 xport '/nangrong/data_sas/1994/current/indiv94.03';
libname in3 xport '/nangrong/data_sas/1994/current/moved94.02';
libname in4 xport '/nangrong/data_sas/1984/current/hh84.01';
libname in5 xport '/nangrong/data_sas/1984/current/comm84.01';
libname in6 xport '/nangrong/data_sas/sacpc/sacpc068.xpt';

libname out1 xport '/trainee/jrhull/paa1996/miglu01.xpt';

title1 'Jim''s PAA96 Program after modifying for efficiency';

*---------------------------------------*
*  Get 1994 Individual-Level Variables  *
*---------------------------------------*;

***************************
**  Get Q1 from indiv94  **
***************************;

data ind94;
  set in2.indiv94(keep=VILL84 HOUSE84 CEP84 Q1 CODE2);

** Keep Code 2s in destination and individuals who link to 1984 **;

  if (CODE2 ^in(1,5)) and (CEP84 ne ' ');

** Rename q1 **;

  rename q1=STATUS;

run;


***********************************
**  Concatenate IND94 to MOVE94  **
***********************************;

data indmoved94;
  set ind94(drop=CODE2)
      in3.moved94(keep=VILL84 HOUSE84 CEP84 MHTYPE);

run;

*** Frequency ***;

proc freq data=indmoved94;
  title2 'Check status and mhtype in 1994';
  tables STATUS MHTYPE;
run;

*** Sort by vill84 house84 cep84 ***;

proc sort data=indmoved94 out=sindmoved94 nodupkey;
  by VILL84 HOUSE84 CEP84;
run;


*-------------------------------------------------*
*  Create and Get 1984 Household-Level Variables  *
*-------------------------------------------------*;

*******************************************************
**  Create mem3to22 and numtmpab using indiv84 file  **
*******************************************************;

data ind84hh;
  set in1.indiv84(keep=VILL84 HOUSE84 CEP84 IN84_06);
  by VILL84 HOUSE84;

  keep VILL84 HOUSE84 MEM3TO22 NUMTMPAB;

  retain MEM3TO22 NUMTMPAB;

  if first.HOUSE84 then do;
                         MEM3TO22=0;
                         NUMTMPAB=0;
                        end;

  if (3 <= IN84_06 <= 22) then MEM3TO22=MEM3TO22+1;

  if (CEP84 > '200') then NUMTMPAB=NUMTMPAB+1;

  label NUMTMPAB='Number of Temporarily Absent HH Members'
        MEM3TO22='HH Members between 3 & 22';

  if last.HOUSE84 then output;

run;

*** Frequency ***;

proc freq data=ind84hh;
  title2 'Check mem3to22 and numtmpab';
  tables MEM3TO22 NUMTMPAB;
run;


*************************************************************
**  Merge ind84hh to hh84 to get other hh-level variables  **
*************************************************************;

data hh84 nohh84 noind84hh;
  merge ind84hh(in=a)
        in4.hh84(keep=VILL84 HOUSE84 HH84_33 HH84_29
                      HH84_30 HH84_37-HH84_48 in=b);
  by VILL84 HOUSE84;

  if a=1 and b=1 then output hh84;
  if a=1 and b=0 then output nohh84;
  if a=0 and b=1 then output noind84hh;

run;


*--------------------------------------------------*
*  Get 1984 Community-Level and Spatial Variables  *
*--------------------------------------------------*;

********************************
**  Merge comm84 to sacpc068  **
********************************;

data commspat84 nospat nocomm84;
  merge in5.comm84(keep=VILL84 V84_206 in=a)
        in6.sacpc068(in=b);
  by VILL84;

  if a=1 and b=1 then output commspat84;
  if a=1 and b=0 then output nospat;
  if a=0 and b=1 then output nocomm84;

run;


*----------------------------------------------------------*
*  Get 1984 Individual-Level Data and Merge in Other Data  *
*----------------------------------------------------------*;

************************************
**  Merge sindmoved94 to indiv84  **
************************************;

data indiv84 noindmoved94 noindiv84;
  merge in1.indiv84(keep=VILL84 HOUSE84 CEP84 IN84_05 IN84_06
                         rename=(IN84_05=SEX IN84_06=AGE) in=a)
        sindmoved94(in=b);
  by VILL84 HOUSE84 CEP84;

  if a=1 and b=1 then output indiv84;
  if a=1 and b=0 then output noindmoved94;
  if a=0 and b=1 then output noindiv84;

run;


*****************************
**  Merge hh84 to indiv84  **
*****************************;

data indiv84hh nohh84b noindiv84b;
  merge indiv84(in=a)
        hh84(in=b);
  by VILL84 HOUSE84;

  if a=1 and b=1 then output indiv84hh;
  if a=1 and b=0 then output nohh84b;
  if a=0 and b=1 then output noindiv84b;

run;


*************************************
**  Merge commspat84 to indiv84hh  **
*************************************;

data indiv84hhcom nocommspat84 noindiv84hh;
  merge indiv84hh(in=a)
        commspat84(in=b);
  by VILL84;

  if a=1 and b=1 then output indiv84hhcom;
  if a=1 and b=0 then output nocommspat84;
  if a=0 and b=1 then output noindiv84hh;

run;


*----------------------------------------------*
*  Create One More Variable and Save the Data  *
*----------------------------------------------*;

data miglu01;
  set indiv84hhcom;

*** Create memnoind ***;

if (MEM3TO22 > 0) then MEMNOIND=MEM3TO22-1;
  else MEMNOIND=0;

label MEMNOIND='HH members between 3 & 22, minus indiv';

run;

*** Contents ***;

proc contents data=miglu01;
  title2 'Contents for miglu01';
run;

*** Frequency ***;

proc freq data=miglu01;
  title2 'Check memnoind';
  tables MEMNOIND;
run;

data out1.miglu01;
     set miglu01;
run;

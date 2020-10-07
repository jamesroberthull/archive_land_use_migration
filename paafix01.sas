********************************************************************
**      Program Name: /trainee/jrhull/paa1996/paafix01.sas
**      Programmer: james r. hull  (With RickO's helpful suggestions!)
**      Start Date: 2005 July 10
**      Purpose:
**          1.) Add extra variables to original file for testing
**          2.) THIS FILE DOES EVERYTHING FROM PAADES00-PAADES04
**        Input Data:
**          1.) /nangrong/data_sas/1984/current/indiv84.02
**          2.) /nangrong/data_sas/1994/current/indiv94.03
**          3.) /nangrong/data_sas/1994/current/moved94.02
**          4.) /nangrong/data_sas/1984/current/hh84.01
**          5.) /nangrong/data_sas/1984/current/comm84.01
**          6.) /nangrong/data_sas/sacpc/sacpc068.xpt
**          7.) /trainee/jrhull/paa1996/sacpc035.xpt
**          8.) /trainee/jrhull/paa1996/spatial.xpt
**
**      Output Data:
**          1.) /trainee/jrhull/paa1996/miglu03.xpt
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
libname in7 xport '/trainee/jrhull/paa1996/sacpc035.xpt';

libname in8 xport '/trainee/jrhull/paa1996/spatial.xpt';

libname out1 xport '/trainee/jrhull/paa1996/miglu03.xpt';
libname out2 xport '/trainee/jrhull/paa1996/m03_12_1.xpt';
libname out3 xport '/trainee/jrhull/paa1996/m13_22_1.xpt';

title1 'Program for testing original model specification';

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

proc sort data=indmoved94 out=sindmoved94 nodupkey;
  by VILL84 HOUSE84 CEP84;
run;


*-----------------------------------------------------*
*  Create and Get 1984 Household-Level Variables      *
*  Create mem3to22 and numtmpab using indiv84 file    *
*-----------------------------------------------------*;

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

*----------------------------------------------------*
* Create Village-level number of temp abs HH members *
*----------------------------------------------------*;

data ind84vil;
     set in1.indiv84 (keep=VILL84 HOUSE84 CEP84);
     by VILL84;

     keep VILL84 VILPOP VILTMPAB;

     retain VILTMPAB VILPOP;

     if first.VILL84 then do;
                            VILPOP=0;
                            VILTMPAB=0;
                          end;

     if (CEP84 > '200') then VILTMPAB=VILTMPAB+1;
     if (CEP84 < '200') then VILPOP=VILPOP+1;

     label VILTMPAB='Number Temporarily Absent in Village';
     label VILPOP='Number of non-absent Villagers';

     if last.VILL84 then output;

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
*  Merge comm84 to sacpc068                        *
*--------------------------------------------------*;

data commspat84 nospat nocomm84 noind84vil nocpc035;
  merge in5.comm84(keep=VILL84 V84_206 in=a)
        in6.sacpc068(in=b)
        in7.sacpc035(in=c)
        in8.spatial (drop=DIF73FOR DIF73NP DIF76FOR DIF76NPA DIF76NPB DIF76NPC in=d)
        ind84vil (in=e);
  by VILL84;

  TOTPOP=VILTMPAB+VILPOP;
  PCTMIGS=VILTMPAB/TOTPOP*100;

  label TOTPOP='Total Population of Village';
  label PCTMIGS='Percent of Temp. Abs. Villagers';

  if a=1 and b=1 and c=1 and d=1 and e=1 then output commspat84;

run;

*----------------------------------------------------------*
*  Get 1984 Individual-Level Data and Merge in Other Data  *
*  Merge sindmoved94 to indiv84                            *
*----------------------------------------------------------*;

data indiv84 noindmoved94 noindiv84;
  merge in1.indiv84(keep=VILL84 HOUSE84 CEP84 IN84_05 IN84_06 IN84_10
                         rename=(IN84_05=SEX IN84_06=AGE IN84_10=MARSTAT) in=a)
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
*  Create Variable memnoind from mem3to22      *
*----------------------------------------------*;

data addmemnoi;
  set indiv84hhcom;

*** Create memnoind ***;

if (MEM3TO22 > 0) then MEMNOIND=MEM3TO22-1;
  else MEMNOIND=0;

label MEMNOIND='HH members between 3 & 22, minus indiv';

run;

/* data poptottest;
     set miglu01;
     by VILL84;
     if first.VILL84 then output;
run;

proc print data=poptottest;
     id VILL84;
     var TOTPOPVI TOTPOP VILTMPAB MIGS_REV VILPOP PERSON84 PCMIG84 PCTMIGS;
     sum TOTPOPVI TOTPOP PERSON84;
run; */

/* NEED TO CHANGE FILE NAMES */

data addasset (drop=HH84_29 HH84_30 HH84_33 HH84_37-HH84_48
                   VILLYR REVILLYR TEMP_ABS SEX v84_206);
     set addmemnoi;

     *** Recode for AGASET84: the 8's and 9's to 0 and . respectively  ***;

     if HH84_29=8 then ITAN=0;
        else if HH84_29=9 then ITAN=.;
        else ITAN=HH84_29;

     if HH84_30=8 then PICKUP=0;
        else PICKUP=HH84_30;

     if HH84_38=98 then CATTLE=0;
        else CATTLE=HH84_38;

     if HH84_40=98 then BUFFALO=0;
        else if HH84_40=99 then BUFFALO=.;
        else BUFFALO=HH84_40;

     if HH84_42=98 then PIGS=0;
        else if HH84_42=99 then PIGS=.;
        else PIGS=HH84_42;

     if HH84_44=98 then GEESE=0;
        else GEESE=HH84_44;

     if HH84_46=98 then DUCKS=0;
        else if HH84_46=99 then DUCKS=.;
        else DUCKS=HH84_46;

     if HH84_48=98 then CHICKENS=0;
        else if HH84_48=99 then CHICKENS=.;
        else CHICKENS=HH84_48;


     *** Create AGASET84 ***;

     *** NOTE: the original variable AGASET84 excluded ITANS
     For this reason, two variables are created, the first
     is exactly the same as the original, the second includes
     the variable measuring ITANS in the total calculation ***;

     AGASET84=(PICKUP*170000) + (CATTLE*8000) + (BUFFALO*6000) +
          (PIGS*2750) + (GEESE*70) + (DUCKS*30) + (CHICKENS*27);

     AGASET_2=(ITAN*170000) + (PICKUP*170000) + (CATTLE*8000) +
          (BUFFALO*6000) + (PIGS*2750) + (GEESE*70) + (DUCKS*30) +
          (CHICKENS*27);


     *** Create VIL_AGE and RVIL_AGE from VILLYR and REVILLYR ***;

     VIL_AGE=(1984-VILLYR);
     RVIL_AGE=(1984-REVILLYR);


     *** CREATE ELECTRIC by re-coding v84_206 2->0 (0 is no)
         1->1 (1 is yes) ***;

     if V84_206=2 then ELECTRIC=0;
     else ELECTRIC=v84_206;


     *** Create MALE by recoding SEX 2->0 (0 is female)
         1->1 (1 is male);

     if SEX=2 then MALE=0;
     else MALE=SEX;


     *** Recode missing values in variable RAI and rename ***;

     if HH84_33=998 then RAI=0;
     else if HH84_33=999 then RAI=.;
     else RAI=HH84_33;


     *** Label newly created variables ***;

     label ITAN='Number of motor/agri cars owned (A3/Q8)'
           PICKUP='Number of pick-up cars owned (A3/Q8)'
           CATTLE='Number of cattle raised (A3/Q12)'
           BUFFALO='Number of buffalo raised (A3/Q12)'
           PIGS='Number of pigs raised (A3/Q12)'
           GEESE='Number of geese raised (A3/Q12)'
           DUCKS='Number of ducks raised (A3/Q12)'
           CHICKENS='Number of chickens raised (A3/Q12)'
           AGASET84='84: Household ag assets'
           AGASET_2='84: Household ag assets (with Itans)'
           VIL_AGE='Village age in 1984'
           RVIL_AGE='Village age in 1984 (logic corrected)'
           ELECTRIC='Electricity in village 0=no 1=yes'
           MALE='Respondent is male 0=female 1=male'
           RAI='How many rai of land HH own? (A3/Q10)';


     *** Select cases in age range desired ***;

     if (3 <= AGE <= 22);

run;

****************************************************************
**  Create Dependent Variable Migration Status - In/Out/LTFU  **
**  Also removes code 0 - dead and code 4 - new, and married  **
****************************************************************;


data adddepvar (drop=MARSTAT);
     set addasset (drop=ITAN PICKUP CATTLE BUFFALO PIGS GEESE DUCKS CHICKENS);
     if STATUS=1 then MIGSTAT=1;
        else if STATUS=2 then MIGSTAT=1;
        else if STATUS=3 then MIGSTAT=2;
        else if STATUS=9 then MIGSTAT=.;
        else if MHTYPE=1 then MIGSTAT=3;
        else if MHTYPE=2 then MIGSTAT=.;
     label MIGSTAT='mig stat 1=in village 2=migrant 3=LTFU';

     *** Select cases: unmarried, living in 1994, and in village in 1984 ***;

     if STATUS ^in (0,4) and MARSTAT ^in (2,9);
run;

proc contents data=adddepvar;
run;

data out1.miglu03;
     set adddepvar;
run;

**********************************************************
**  Create two separate data files based on age groups  **
**********************************************************;

data out2.m03_12_1;
     set adddepvar;
     if age < 13;
run;


data out3.m13_22_1;
     set adddepvar;
     if age > 12;
run;

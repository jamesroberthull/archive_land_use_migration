*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paades02.sas
**     Programmer: james r. hull
**     Start Date: 2005 March 15
**     Purpose:
**        1.) Create new variables needed to replicate 1996 regression
**            analysis and generate descriptive statistics for all var's
**
**     Input Data:
**        1.) /trainee/jrhull/paa1996/miglu01.xpt
**
**     Output Data:
**        1.) /trainee/jrhull/paa1996/miglu02.xpt
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=60;

title1 'PAA1996: generates variables and descriptive statistics';

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/trainee/jrhull/paa1996/miglu01.xpt';
libname out1 xport '/trainee/jrhull/paa1996/miglu02.xpt';

*********************************************************************
**  Run frequencies to see what needs to be recoded for variables  **
*********************************************************************;

/*proc freq data=in1.miglu01;
     title2 "ownership of various assets in 1984";
     tables hh84_29 hh84_30 HH84_38 HH84_40 HH84_42 HH84_44 HH84_46 HH84_48;
run;

proc freq data=in1.miglu01;
     title2 "purpose of ownership questions";
     tables hh84_37 hh84_39 hh84_41 hh84_43 hh84_45 hh84_47;
run;

proc freq data=in1.miglu01;
     title2 "Status variable and mhtype variable";
     tables status mhtype;
run;

proc freq data=in1.miglu01;
     title2 "Electrification";
     tables v84_206;
run;

proc freq data=in1.miglu01;
     title2 "temp_abs";
     tables temp_abs;
run;*/


******************************
**  Create var's: agaset84, agaset_2,
*******************************;

data out1.miglu02 (drop=HH84_29 HH84_30 HH84_33 HH84_37-HH84_48
                   VILLYR REVILLYR TEMP_ABS SEX v84_206);
     set in1.miglu01;

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

*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paades06.sas
**     Programmer: james r. hull
**     Start Date: 2005 September 30
**     Purpose:
**        1.) Create 1996 original data file and match 1996-2005 file
**
**     Input Data:
**
**        1.)'/nangrong/data_sas/sacpc/sacpc031.xpt'
**        2.)'/nangrong/data_sas/sacpc/sacpc043.xpt'
**        3.)'/nangrong/data_sas/sacpc/sacpc045.xpt'
**        4.)'/nangrong/data_sas/sacpc/sacpc046.xpt'
**        5.)'/nangrong/data_sas/sacpc/sacpc068.xpt'
**        6.)'/nangrong/data_sas/sacpc/sacpc072.xpt'
**        7.)'/nangrong/data_sas/paa96/sacpc044.xpt'
**
**     Output Data:
**        1.)'/trainee/jrhull/paa1996/m03_12_2.xpt'
**        2.)'/trainee/jrhull/paa1996/m13_22_2.xpt'
**
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=55;

title1 'PAA1996: ';

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/nangrong/data_sas/sacpc/sacpc031.xpt';
libname in2 xport '/nangrong/data_sas/sacpc/sacpc043.xpt';
libname in3 xport '/nangrong/data_sas/sacpc/sacpc045.xpt';
libname in4 xport '/nangrong/data_sas/sacpc/sacpc046.xpt';
libname in5 xport '/nangrong/data_sas/sacpc/sacpc068.xpt';
libname in6 xport '/nangrong/data_sas/sacpc/sacpc072.xpt';
libname in7 xport '/nangrong/data_sas/paa96/sacpc044.xpt';
libname in8 xport '/nangrong/data_sas/1984/current/indiv84.02';

libname out1 xport '/trainee/jrhull/paa1996/m03_12_2.xpt';
libname out2 xport '/trainee/jrhull/paa1996/m13_22_2.xpt';
libname out3 xport '/trainee/jrhull/paa1996/m03_12_3.xpt';
libname out4 xport '/trainee/jrhull/paa1996/m13_22_3.xpt';

*----------------------------------------------------*
*  Compile all spatial variables into a single file  *
*----------------------------------------------------*;

data work1;
     merge
       in1.sacpc031 (keep=VILL84 GCOP3 GCOB3 GNP73B3 GNP76B3 GFOR73B3 GFOR76B3)
       in2.sacpc043 (keep=VILL84 ORGCOM3K SETCOM3K STCOM3KA)
       /* in3.sacpc045 (keep=VILL84 G73B3FO G76B3FO)
       in4.sacpc046 (keep=VILL84 GVNP3K73 GVNP3K76) */
       in5.sacpc068 (keep=VILL84 G3BPPVIL G3BOLVIL G3B73AF G3D73AF G3B76AF G3D76AF G3B73NF G3B76NF)
       in6.sacpc072;
     by vill84;

     GFOR73B3=GFOR73B3*100;   *** Recode from proportion forest to % forest ***;
     GFOR76B3=GFOR76B3*100;

run;

/* proc contents data=in7.sacpc044;
run; */

/* THIS IS THE WHOLE SACPC DATA FILE W/ 17342 CASES */

data work2 nohhleveldata novildata;
     merge in7.sacpc044 (in=a)
           work1 (in=b);
     by vill84;

     if a=1 and b=1 then output work2;
        else if a=1 and b=0 then output novildata;
        else if a=0 and b=1 then output nohhleveldata;
run;

proc contents data=work2;
run;

proc freq data=work2;
     tables age84 age84gr elct84 ginicult absent84  mstat84
     hdjute84 pcmig84 person84 q1_1 sex84 where94 where94b;
run;

/* THIS IS THE SACPC DATA FILE WITH CASES REMOVED (DEAD, NOINFO, MARRIED, DIV, SEP, WID) */

data work3;
     set work2;

     if sex84=2 then sex84=0;

     if q1_1 ^in (0,9) and where94 ne 4 and mstat84 ^in (2,3,.) /* and absent84 ne 1 */ ;

run;

proc freq data=work3;
     tables q1_1 where94 where94b age84gr mstat84 sex84;
run;

data work4a;
     set in8.indiv84 (keep=vill84 house84 cep84 in84_05 in84_06 in84_10);
     if in84_06 > 2 and in84_06 <23;
run;

data work4b nosacpc044 nonewdata;
     merge work4a (in=a)
           work2 (in=b);
     by vill84 house84 cep84;

     if a=1 and b=1 then output work4b;
     if a=1 and b=0 then output nosacpc044;
     if a=0 and b=1 then do;
                            LOSTCASE=1;
                            output nonewdata;
                         end;
run;

proc freq data=work4b;
     tables q1_1 where94 where94b age84gr mstat84 sex84 /*lostcase*/ ;
run;

/*CREATES A DATASET WITH ALL 17342 CASES FROM SACPC044, MINUS EXCLUSIONS */

data work5;
     set work4b;

     if sex84=2 then sex84=0;

     if q1_1 ^in (0,9) and where94 ne 4 and mstat84 ^in (2,3,.) /* and absent84 ne 1 */ ;

run;

/* CREATES A DATASET WITH THE 17273 CASES THAT MATCHED B/T SACPC044 & NEW DATA, MINUS EXCLUSIONS */

data work6;
     set work4b;

     if sex84=2 then sex84=0;

     if q1_1 ^in (0,9) and where94 ne 4 and mstat84 ^in (2,3,.) /* and LOSTCASE ne 1 and absent84 ne 1 */ ;

run;

proc freq data=work6;
     tables q1_1 where94 where94b age84gr mstat84 sex84 /*lostcase*/ ;
run;

**********************************************************
**  Create two separate data files based on age groups  **
**********************************************************;

/* SEE DISTINCTIONS ABOVE */

data out1.m03_12_2;
     set work5;
     if age84gr =1;
run;

data out2.m13_22_2;
     set work5;
     if age84gr =2;
run;

/* SEE DISTINCTIONS ABOVE */

data out3.m03_12_3;
     set work6;
     if age84gr =1;
run;

data out4.m13_22_3;
     set work6;
     if age84gr =2;
run;

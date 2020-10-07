*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paareg01.sas
**     Programmer: james r. hull
**     Start Date: 2005 April 17
**     Purpose:
**        1.) Performs initial replication of regression in PAA 1996
**            (actually it creates the data sets that will be converted
**            to STATA format so that I can use robust errors in mlogit)
**     Input Data:
**        1.) /trainee/jrhull/paa1996/miglu03.xpt
**
**     Output Data:
**        1.) /trainee/jrhull/paa1996/m03_12_1.xpt
**        2.) /trainee/jrhull/paa1996/m13_22_1.xpt
**
*********************************************************************;

***************
**  Options  **
***************;

options nocenter linesize=80 pagesize=55;

title1 'PAA1996: multinomial logistic regression';

**********************
**  Data Libraries  **
**********************;

libname in1 xport '/trainee/jrhull/paa1996/miglu03.xpt';
libname out1 xport '/trainee/jrhull/paa1996/m03_12_1.xpt';
libname out2 xport '/trainee/jrhull/paa1996/m13_22_1.xpt';


**********************************************************
**  Create two separate data files based on age groups  **
**********************************************************;

data out1.m03_12_1;
     set in1.miglu03;
     if age < 13;
run;


data out2.m13_22_1;
     set in1.miglu03;
     if age > 12;
run;

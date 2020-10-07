*********************************************************************
**     Program Name: /trainee/jrhull/paa1996/paades04.sas
**     Programmer: james r. hull
**     Start Date: 2005 May 3
**     Purpose:
**        1.) Check out original files used in PAA paper
**        2.) Create file containing all spatial variables
**
**     Input Data:
**        1.)'/nangrong/data_sas/sacpc/sacpc031.xpt'
**        2.)'/nangrong/data_sas/sacpc/sacpc043.xpt'
**        3.)'/nangrong/data_sas/sacpc/sacpc045.xpt'
**        4.)'/nangrong/data_sas/sacpc/sacpc046.xpt'
**        5.)'/nangrong/data_sas/sacpc/sacpc068.xpt'
**        6.)'/nangrong/data_sas/sacpc/sacpc072.xpt'
**
**     Output Data:
**        1.)'/trainee/jrhull/paa1996/spatial.xpt'
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

libname out1 xport '/trainee/jrhull/paa1996/spatial.xpt';

********************************************************************
**  Bring all datasets into working folder so they can be viewed  **
********************************************************************;


/* proc contents data=work1 varnum;
proc contents data=work2 varnum;
proc contents data=work3 varnum;
proc contents data=work4 varnum;
proc contents data=work5 varnum;
run; */


data work1;
     merge
       in1.sacpc031 (keep=VILL84 GCOP3 GCOB3 GNP73B3 GNP76B3 GFOR73B3 GFOR76B3)
       in2.sacpc043 (keep=VILL84 ORGCOM3K SETCOM3K STCOM3KA)
       in3.sacpc045 (keep=VILL84 G73B3FO G76B3FO)
       in4.sacpc046 (keep=VILL84 GVNP3K73 GVNP3K76)
       in5.sacpc068 (keep=VILL84 G3BPPVIL G3BOLVIL G3B73AF G3D73AF G3B76AF G3D76AF G3B73NF G3B76NF)
       in6.sacpc072;
     by vill84;

     GFOR73B3=GFOR73B3*100;
     GFOR76B3=GFOR76B3*100;

     DIF73FOR=G3B73AF-G73B3FO;
     DIF76FOR=G3B76AF-G76B3FO;
     DIF73NP=G3B73NF-GVNP3K73;
     DIF76NPA=G3B76NF-GVNP3K76;
     DIF76NPB=G3B76NF-GNP76B3;
     DIF76NPC=GVNP3K76-GNP76B3;

run;

proc contents data=work1 varnum;
run;

proc means data=work1 maxdec=2 fw=6 mean stddev min max;
     var GCOP3 ORGCOM3K SETCOM3K STCOM3KA G3BPPVIL;
run;

proc means data=work1 maxdec=2 fw=6 mean stddev min max;
     var GCOB3 G3BOLVIL;
run;

proc means data=work1 maxdec=2 fw=6 mean stddev min max;
     var GNP73B3 GVNP3K73 G3B73NF;
run;

proc means data=work1 maxdec=2 fw=6 mean stddev min max;
     var GNP76B3 GVNP3K76 G3B76NF;
run;

proc means data=work1 maxdec=2 fw=6 mean stddev min max;
     var GFOR73B3 G73B3FO G3B73AF G3D73AF;
run;

proc means data=work1 maxdec=2 fw=6 mean stddev min max;
     var GFOR76B3 G76B3FO G3B76AF G3D76AF;
run;

proc print data=work1;
     id VILL84;
     var GVNP3K73 G3B73NF DIF73NP;
run;

proc print data=work1;
     id VILL84;
     var GNP76B3 GVNP3K76 G3B76NF DIF76NPA DIF76NPB DIF76NPC;
run;

proc print data=work1;
     id VILL84;
     var G73B3FO G3B73AF DIF73FOR;
run;

proc print data=work1;
     id VILL84;
     var G76B3FO G3B76AF DIF76FOR;
run;

proc corr data=work1 noprob nosimple;
     var GNP73B3 GVNP3K73 G3B73NF;
run;

proc corr data=work1 noprob nosimple;
     var GNP76B3 GVNP3K76 G3B76NF;
run;

proc corr data=work1 noprob nosimple;
     var GFOR73B3 G73B3FO G3B73AF;
run;

proc corr data=work1 noprob nosimple;
     var GFOR76B3 G76B3FO G3B76AF;
run;

data out1.spatial;
     set work1;
run;

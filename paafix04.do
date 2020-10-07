/* NOTE: This file used only to test models using spatial var's based on recreated 1996 and 2005 classifications */
/* It looks very much like many other do-files created so far, and could easily be confused */

log close
log using paafix04, replace text

/*****************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering             */
/* THESE MODELS USE NEWLY CREATED VERSIONS OF THE SPATIAL VARIABLES BASED ON THE 2005 CLASSIFICATION */
/*****************************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n73f05 g3p73f05, robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n76f05 g3p76f05, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n73f05 g3p73f05, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n76f05 g3p76f05, basecategory(1) robust cluster (vill84) 


/*****************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering             */
/* THESE MODELS USE NEWLY CREATED VERSIONS OF THE SPATIAL VARIABLES BASED ON THE 1996 CLASSIFICATION */
/*****************************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n73f96 g3p73f96, robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n76f96 g3p76f96, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22 */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n73f96 g3p73f96, basecategory(1) robust cluster (vill84) 
 
/*1976*/

/* Regression: 13-22 */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 g3n76f96 g3p76f96, basecategory(1) robust cluster (vill84) 


/*****************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1998 paper, w/ clustering             */
/* THESE MODELS USE NEWLY CREATED VERSIONS OF THE SPATIAL VARIABLES BASED ON THE 2005 CLASSIFICATION */
/*****************************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n73f05 g3p73f05, robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n76f05 g3p76f05, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n73f05 g3p73f05, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n76f05 g3p76f05, basecategory(1) robust cluster (vill84)


/*****************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1998 paper, w/ clustering             */
/* THESE MODELS USE NEWLY CREATED VERSIONS OF THE SPATIAL VARIABLES BASED ON THE 1996 CLASSIFICATION */
/*****************************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n73f96 g3p73f96, robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n76f96 g3p76f96, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n73f96 g3p73f96, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka g3n76f96 g3p76f96, basecategory(1) robust cluster (vill84)


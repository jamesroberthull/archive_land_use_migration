/* NOTE: This file used only to test models using 1996 and 1998 spatial variables */
/* It looks very much like the 'normal' do-file, and could easily be confused */

/*****************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering */
/*****************************************************************************************/

log close
log using paafix02, replace text

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, robust cluster (vill84) 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, basecategory(1) robust cluster (vill84) 
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, basecategory(1) robust cluster (vill84) 



/*****************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1998 paper, w/ clustering */
/*****************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k73 g73b3fo, robust cluster (vill84) 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k76 g76b3fo, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84)




/*****************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1998 paper, w/ clustering */
/*****************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, robust cluster (vill84) 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84)


/********************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996/8 paper, w/o clustering */
/********************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3
           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, basecategory(1)  
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, basecategory(1)  



/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k73 g73b3fo
           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k76 g76b3fo

/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k73 g73b3fo, basecategory(1)  
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k76 g76b3fo, basecategory(1) 


/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1)  
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) 



/**********************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996/8 paper, w/ HH clustering */
/**********************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, robust cluster (house84) 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, robust cluster (house84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, basecategory(1) robust cluster (house84) 
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, basecategory(1) robust cluster (house84) 



/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k73 g73b3fo, robust cluster (house84) 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k76 g76b3fo, robust cluster (house84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k73 g73b3fo, basecategory(1) robust cluster (house84) 
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 stcom3ka gvnp3k76 g76b3fo, basecategory(1) robust cluster (house84)



/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, attept to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, robust cluster (house84) 

           
/*1976*/

/* Regression: 3-12, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, robust cluster (house84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster*/
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (house84) 
 
/*1976*/

/* Regression: 13-22, attempt to replicate original 1998 analysis exactly w/cluster */
mlogit migstat male age pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (house84)



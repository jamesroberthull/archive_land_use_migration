/* NOTE: This file used to test models using the EXACT ORIGINAL DATA AND EXACT VARIABLES from SACPC044 w/ old & new spatial var's */
/* As usual, it looks very much like many other do-files created so far, and could easily be confused         */

log close
log using paafix07, replace text

/********************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering - BUF Comp Var */
/********************************************************************************************************/

/* AGES 3-12 */

use m03_12_2.dta

/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_2.dta


/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 


/********************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/o clustering - BUF Comp Var */
/********************************************************************************************************/

/* AGES 3-12 */

use m03_12_2.dta

/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1)  

           
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1)  



/* AGES 13-22 */

use m13_22_2.dta


/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1)  
 
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) 


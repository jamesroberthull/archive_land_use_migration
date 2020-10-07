/* NOTE: This file used to test models using the EXACT ORIGINAL DATA from SACPC044 w/ old & new spatial var's */
/* As usual, it looks very much like many other do-files created so far, and could easily be confused         */

log close
log using paafix06, replace text

/********************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering - BUF Comp Var */
/********************************************************************************************************/

/* AGES 3-12 */

use m03_12_2.dta

/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, basecategory(1) robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_2.dta


/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp73b3 gfor73b3, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcob3 gnp76b3 gfor76b3, basecategory(1) robust cluster (vill84) 


/*********************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering  - PIP Comp Var */
/*********************************************************************************************************/

/* AGES 3-12 */

use m03_12_2.dta

/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcop3 gnp73b3 gfor73b3, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcop3 gnp76b3 gfor76b3, basecategory(1) robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_2.dta


/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcop3 gnp73b3 gfor73b3, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 gcop3 gnp76b3 gfor76b3, basecategory(1) robust cluster (vill84) 


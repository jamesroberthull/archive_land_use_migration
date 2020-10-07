/* NOTE: This file used to test models using the EXACT ORIGINAL DATA from SACPC044 w/ SACPC068 spatial var's  */
/* As usual, it looks very much like many other do-files created so far, and could easily be confused         */

log close
log using paafix12, replace text

/*********************************************************************************************************/
/* Regression of approximately all ORIGINAL variables from the 1996 paper, w/ clustering - PIP Comp Var  */
/* DATA ARE THE 17,281 CASES THAT MATCHED BETWEEN SACPC044 & CURRENT DATA, MINUS EXCLUSIONS (53, NOT 61) */
/*********************************************************************************************************/

/* AGES 3-12 */

use m03_12_3.dta

/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 g3bppvil g3b73nf g3b73af, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 g3bppvil g3b76nf g3b76af, basecategory(1) robust cluster (vill84) 


/* AGES 13-22 */

use m13_22_3.dta


/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 g3bppvil g3b73nf g3b73af, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 g3bppvil g3b76nf g3b76af, basecategory(1) robust cluster (vill84) 



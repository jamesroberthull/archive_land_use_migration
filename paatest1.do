/* NOTE: This file used only to test models using 1996 and 1998 spatial variables */
/* It looks very much like the 'normal' do-file, and could easily be confused */

/************************************************************************************/
/* Regression of all NEWLY created social variables with ORIGINAL spatial variables */
/************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, basic variables, 84 p-in-p, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil gvnp3k73 g73b3fo, robust cluster (vill84) 


           
/*1976*/

/* Regression: 3-12, basic variables, 84 p-in-p, 76 #patches, 76 % forest, 76 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil gvnp3k76 g76b3fo, robust cluster (vill84) 



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, basic variables, 84 p-in-p, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 

 
/*1976*/

/* Regression: 13-22, basic variables, 84 p-in-p, 76 #patches, 76 % forest, 76 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 




/****************************************************************************************************************************************/
/* Regression of all Newly created social variables with ORIGINAL spatial variables, w/o robust standard errors & using Buffer Overlaps */
/****************************************************************************************************************************************/


/* AGES 3-12 */

use m03_12_1.dta

/*1973*/

/* Regression: 3-12, basic variables, 84 buffer, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bolvil gvnp3k73 g73b3fo 


           
/*1976*/

/* Regression: 3-12, basic variables, 84 buffer, 76 #patches, 76 % forest, 76 contagion, revised village age, revised ag assets */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bolvil gvnp3k76 g76b3fo



/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

/* Regression: 13-22, basic variables, 84 buffer, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bolvil gvnp3k73 g73b3fo, basecategory(1)

 
/*1976*/

/* Regression: 13-22, basic variables, 84 buffer, 76 #patches, 76 % forest, 76 contagion, revised village age, revised ag assets */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bolvil gvnp3k76 g76b3fo, basecategory(1) 





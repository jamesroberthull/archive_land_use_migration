/*************************************************************************************/
/* This File is to be used in generating the large sensitivity-testing table project */
/* Started on 4 January 2006 There will be many of these that look very similar!!!!! */
/*************************************************************************************/


log close
log using paagrd03, replace text


/***************************************************************************************************/
/* Regression using variable group "B"                                                             */
/* Samples are, respectively: 1996, match (96 selection), match (05 selection),                    */   
/* 2005 not married, 2005 never married (when permissible)                                         */
/***************************************************************************************************/

/* AGES 3-12 */

use m03_12_2.dta  /* 1996 SAMPLE - 16233 cases */

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


/***************************************************************************************************/
/* Regression using variable group "B"                                                             */
/* Samples are, respectively: 1996, match (96 selection), match (05 selection),                    */   
/* 2005 not married, 2005 never married (when permissible)                                         */
/***************************************************************************************************/

/* AGES 3-12 */

use m03_12_3.dta   /* 1996-2005 Match SAMPLE (1996 variable selection) - 16173 cases */

/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 


/* AGES 13-22 */

use m13_22_3.dta


/*1973*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit where94 sex84 age84 pcmig84 elct84 person84 ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 



/***************************************************************************************************/
/* Regression using variable group "B"                                                             */
/* Samples are, respectively: 1996, match (96 selection), match (05 selection),                    */   
/* 2005 not married, 2005 never married (when permissible)                                         */
/***************************************************************************************************/

/* AGES 3-12 */

use m03_12_5.dta   /* 1996-2005 Match SAMPLE (2005 variables selection) - 15961 cases */

/*1973*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 


/* AGES 13-22 */

use m13_22_5.dta


/*1973*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 



/***************************************************************************************************/
/* Regression using variable group "B"                                                             */
/* Samples are, respectively: 1996, match (96 selection), match (05 selection),                    */   
/* 2005 not married, 2005 never married (when permissible)                                         */
/***************************************************************************************************/

/* AGES 3-12 */

use m03_12_1.dta   /* 2005 NOT MARRIED SAMPLE - 16016 cases (-98 missing data) */

/*1973*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 


/* AGES 13-22 */

use m13_22_1.dta


/*1973*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 



/***************************************************************************************************/
/* Regression using variable group "B"                                                             */
/* Samples are, respectively: 1996, match (96 selection), match (05 selection),                    */   
/* 2005 not married, 2005 never married (when permissible)                                         */
/***************************************************************************************************/

/* AGES 3-12 */

use m03_12_4.dta   /* 2005 NEVER MARRIED SAMPLE - 15978 cases (-98 missing data) */

/*1973*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 

           
/*1976*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 


/* AGES 13-22 */

use m13_22_4.dta


/*1973*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k73 g73b3fo, basecategory(1) robust cluster (vill84) 
 
/*1976*/

mlogit migstat male age pctmigs electric totpop ginicult hdjute84 setcom3k gvnp3k76 g76b3fo, basecategory(1) robust cluster (vill84) 



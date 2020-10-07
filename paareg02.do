
/* AGES 3-12 */

use m03_12_1.dta


/* Testing specifications */ 

/* Regression: 3-12, basic variables, 84 p-in-p, 73 #patches, 73 % forest, revised village age, original ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset84 rvil_age memnoind g3bppvil g3b73nf g3b73af, robust cluster (vill84) 

/* Regression: 3-12, basic variables, 84 buffer, 73 #patches, 73 % forest, revised village age, original ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset84 rvil_age memnoind g3bolvil g3b73nf g3b73af, robust cluster (vill84) 

/* Regression: 3-12, basic variables, 84 p-in-p, 73 #patches, 73 % forest, original village age, original ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset84 vil_age memnoind g3bppvil g3b73nf g3b73af, robust cluster (vill84) 

/* Regression: 3-12, basic variables, 84 p-in-p, 73 #patches, 73 % forest, revised village age, revised ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b73nf g3b73af, robust cluster (vill84) 

/* Regression: 3-12, basic variables, 84 p-in-p, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b73nf g3b73af g3b73cl, cluster (vill84) 
 


/*1972*/

/* Regression: 3-12, basic variables, 84 p-in-p, 72 #patches, 72 % forest, 72 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b72nf g3b72af g3b72cl, robust cluster (vill84) 



/*1973*/

/* Regression: 3-12, basic variables, 84 p-in-p, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b73nf g3b73af g3b73cl, robust cluster (vill84) 



/*1975*/

/* Regression: 3-12, basic variables, 84 p-in-p, 75 #patches, 75 % forest, 75 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b75nf g3b75af g3b75cl, robust cluster (vill84) 
                      

          
/*1976*/

/* Regression: 3-12, basic variables, 84 p-in-p, 76 #patches, 76 % forest, 76 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b76nf g3b76af g3b76cl, robust cluster (vill84) 



/*1979*/

/* Regression: 3-12, basic variables, 84 p-in-p, 79 #patches, 79 % forest, 79 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b79nf g3b79af g3b79cl, robust cluster (vill84) 



/*1979 - w/ scrub classes*/

/* Regression: 3-12, basic variables, 84 p-in-p, 79 #patches, 79 % forest/scrub, 79 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b79na g3b79af g3b79cla, robust cluster (vill84) 



/*1985*/

/* Regression: 3-12, basic variables, 84 p-in-p, 85 #patches, 85 % forest, 85 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b85nf g3b85af g3b85cl, robust cluster (vill84) 




/* AGES 13-22 */

use m13_22_1.dta

 
/*1972*/

/* Regression: 13-22, basic variables, 84 p-in-p, 72 #patches, 72 % forest, 72 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b72nf g3b72af g3b72cl, basecategory(1) robust cluster (vill84) 



/*1973*/

/* Regression: 13-22, basic variables, 84 p-in-p, 73 #patches, 73 % forest, 73 contagion, revised village age, revised ag assets robust w/cluster*/
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b73nf g3b73af g3b73cl, basecategory(1) robust cluster (vill84) 

 

/*1975*/

/* Regression: 13-22, basic variables, 84 p-in-p, 75 #patches, 75 % forest, 75 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b75nf g3b75af g3b75cl, basecategory(1) robust cluster (vill84) 


/*1976*/

/* Regression: 13-22, basic variables, 84 p-in-p, 76 #patches, 76 % forest, 76 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b76nf g3b76af g3b76cl, basecategory(1) robust cluster (vill84) 



/*1979*/

/* Regression: 13-22, basic variables, 84 p-in-p, 79 #patches, 79 % forest, 79 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b79nf g3b79af g3b79cl, basecategory(1) robust cluster (vill84) 



/*1979 - w/ scrub classes*/

/* Regression: 13-22, basic variables, 84 p-in-p, 79 #patches, 79 % forest/scrub, 79 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b79na g3b79af g3b79cla, basecategory(1) robust cluster (vill84) 



/*1985*/

/* Regression: 13-22, basic variables, 84 p-in-p, 85 #patches, 85 % forest, 85 contagion, revised village age, revised ag assets, robust w/cluster */
mlogit migstat male age numtmpab electric rai agaset_2 rvil_age memnoind g3bppvil g3b85nf g3b85af g3b85cl, basecategory(1) robust cluster (vill84) 




/* Colinearity Test of variables in PAA 1996 Replication */


log using paareg03, text

use m03_12_1.dta

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g72for1n g72for1p g72landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g73for1n g73for1p g73landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g75for1n g75for1p g75landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g76for1n g76for1p g76landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g79for1n g79for1p g79landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g79all1n g79all1p g79lanac
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g85for1n g85for1p g85landc
vif


use m13_22_1.dta

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g72for1n g72for1p g72landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g73for1n g73for1p g73landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g75for1n g75for1p g75landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g76for1n g76for1p g76landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g79for1n g79for1p g79landc
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g79all1n g79all1p g79lanac
vif

reg migstat male age numtmpab electric rai agaset_2 rvil_age memnoind gcompol3 g85for1n g85for1p g85landc
vif
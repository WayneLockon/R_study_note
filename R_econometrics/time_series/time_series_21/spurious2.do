clear all

use spurious2

twoway(tsline exchange, yaxis(1) lpattern (longdash)) (tsline labor, yaxis(2) lpattern(solid)) if time>=tm(1973m1), tlabel(1980m1 1990m1 2000m1 2010m1)
graph rename plot1

correlate exchange labor

reg exchange labor, r

reg exchange L(1/4).exchange labor, r

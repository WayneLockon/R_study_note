clear all

set obs 100
gen time = 1905 + _n - 1
tsset time
set seed 1
gen e1=rnormal()
gen y1=e1
replace y1=L.y1+e1 if time>1905
gen e2=rnormal()
gen y2=e2
replace y2=L.y2+e2 if time>1905
replace y2 = -y2
tsline y1 y2, lpattern (solid longdash)
correlate y1 y2
reg y1 y2, r
reg y1 L.y1 y2,r


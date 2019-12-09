cd "C:\Users\13375\Desktop\高宏"

import excel using "mrwdata.xls", firstrow clear

destring N, replace force
save data.dta
clear

use data.dta
keep if N==1
drop I O yr60 Schl
save data_N.dta,replace
clear

use data.dta
keep if I==1
drop N O yr60 Schl
save data_I.dta,replace
clear

use data.dta
keep if O==1
drop I N yr60 Schl
save data_O.dta,replace
clear

#数据准备完毕
use data_N.dta
gen n1=log(n+5)
gen lnIY=log(IY)
gen ln85=log(yr85)
gen x1=lnIY-n1
reg ln85 lnIY n1
outreg2 using result1.xls, replace
reg ln85 x1
outreg2 using result1_restricted,replace
clear

use data_I.dta
gen n1=log(n+5)
gen lnIY=log(IY)
gen ln85=log(yr85)
gen x1=lnIY-n1
reg ln85 lnIY n1
outreg2 using result2.xls,replace
reg ln85 x1
outreg2 using result2_restricted,replace
clear

use data_O.dta
gen n1=log(n+5)
gen lnIY=log(IY)
gen ln85=log(yr85)
gen x1=lnIY-n1
reg ln85 lnIY n1
outreg2 using result3.xls,replace
reg ln85 x1
outreg2 using result3_restricted,replace
clear

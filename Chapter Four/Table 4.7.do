***************************
**// Table 7 (Extra Papers)
**************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
xtset IDStudy

**//OLS(PIP>0.5)
ivreg2 PCC citations firstpub OLS reviewed_journal Concentration Logit  macro ///
HHI FE RE developed T Zscore global [pweight=investperst], cluster (IDStudy) 


**//Rearrange data for Table 7-BMA
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off
gen double lnobs = ln(Samplesize)
count
local variables PCC SEPCC dummies Hstatistic developed undeveloped Logit lnobs citations firstpub quadratic Boone IFrecursive ///
regulation OLS reviewed_journal ownership Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization 

foreach x of varlist `variables' {
				gen `x'_w = `x' * investperst
}


order PCC_w SEPCC_w dummies_w Hstatistic_w developed_w undeveloped_w Logit_w ///
lnobs_w citations_w firstpub_w quadratic_w Boone_w IFrecursive_w  ///
regulation_w OLS_w reviewed_journal_w ownership_w Concentration_w FE_w ///
endogeneity_w NPL_w Lerner_w global_w HHI_w macro_w ///
Zscore_w RE_w T_w DtoD_w sampleyear_w GMM_w someAveraged_w ///
profit_volat_w profitability_w SLS_w capitalization_w

drop PCC SEPCC dummies Hstatistic developed undeveloped Logit ///
lnobs firstpub quadratic Boone   ///
regulation OLS reviewed_journal ownership Concentration ///
FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability ///
SLS capitalization IDStudy t Samplesize investperst ///
mixed Otherstability othercompetition Othermethod

**//save as Extra Papers_weighted.csv

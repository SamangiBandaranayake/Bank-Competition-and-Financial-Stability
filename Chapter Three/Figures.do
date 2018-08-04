***********************************************************************
**//Codes to produce Figures 1A-4A - Zigraiova and Havranek (2016)
***********************************************************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Z&Hcompetition.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
gen double root=sqrt(Samplesize)
gen double invlnobs=1/lnobs
gen double invroot=1/root
bysort IDStudy: egen PCCmed = median(PCC)
bysort IDStudy: egen invSEPCCmed = median(invSEPCC)
bysort IDStudy: egen SEPCCmed = median(SEPCC)
bysort IDStudy: egen tmed = median(t)

*************
**//Figure 1A
*************
*Summary statistics and plots:
graph twoway (scatter PCCmed firstpub, msize(*1.5) msymbol(Oh)) ///
(lfit PCCmed firstpub)

*************
**//Figure 2A
*************
*Box plot:
label define stu 1 "Agoraki et al.(2011)"
label define stu 2 "Anginer et al.(2014)", add
label define stu 3 "Bazzana and Yaldiz(2010)", add
label define stu 4 "Beck et al.(2013)", add
label define stu 5 "Beck et al.(2006)", add
label define stu 6 "Beck et al.(2007)", add
label define stu 7 "Berger et al.(2008)", add
label define stu 8 "Boyd et al.(2006)", add
label define stu 9 "Cajueiro et al.(2012)", add
label define stu 10 "Andries and Capraru(2010)", add
label define stu 11 "Cihak et al.(2009)", add
label define stu 12 "Cihak and Schaeck(2012)", add
label define stu 13 " Cipollini and Fiordelisi(2009)", add
label define stu 14 "Hope et al.(2013)", add
label define stu 15 "Cihak and Hesse(2010)", add
label define stu 16 "Cihak and Schaeck(2008)", add
label define stu 17 "De Nicolo and Loukoianova(2007)", add
label define stu 18 "Fernandez & Garza-Garciab(2012)", add
label define stu 19 "Fu et al.(2014)", add
label define stu 20 "Jeon and Lim(2013)", add
label define stu 21 "Liu et al.(2010)", add
label define stu 22 "Liu and Wilson(2011)", add
label define stu 23 "Liu et al.(2012)", add
label define stu 24 "Machrouch et al.(2013)", add
label define stu 25 "Samantas(2013)", add
label define stu 26 "Turk-Ariss(2010)", add
label define stu 27 "Iskenderoglu and Tomak(2013)", add
label define stu 28 "Heimeshoff and Uhde(2009)", add
label define stu 29 "Fungcova and Weill(2009)", add
label define stu 30 "Micco and Yeyati(2007)", add
label define stu 31 "Deltuvaite(2012)", add
label values IDStudy stu
graph hbox PCC, over(IDStudy)

*************
**//Figure 3A
*************
mean PCC
mean PCCmed
mean PCC if reviewed_journal==1
hist PCC, addplot(pci 0 -0.0008652 5.75 -0.0008652 || pci 0 0.0099988 5.75 0.0099988 || pci 0 0.0115785 5.75 0.0115785)

*************
**//Figure 4A
*************
**//Funnel plots: 
**A:all estimates
scatter invSEPCC PCC, msize(*.9) msymbol(Oh)
**B:Median estimates
scatter invSEPCCmed PCCmed, msize(*.9) msymbol(Oh)

********************************************************
**//Codes to produce Figures (1B-4B) - Re-coded Data
******************************************************** 
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
gen double root=sqrt(Samplesize)
gen double invlnobs=1/lnobs
gen double invroot=1/root
bysort IDStudy: egen PCCmed = median(PCC)
bysort IDStudy: egen invSEPCCmed = median(invSEPCC)
bysort IDStudy: egen SEPCCmed = median(SEPCC)
bysort IDStudy: egen tmed = median(t)

**************
**// Figure 1B
**************
*Summary statistics and plots
graph twoway (scatter PCCmed firstpub, msize(*1.5) msymbol(Oh)) ///
(lfit PCCmed firstpub)

**************
**// Figure 2B
**************
*Box plot
label define stu 1 "Agoraki et al. (2011)"
label define stu 2 "Anginer et al. (2014)", add
label define stu 3 "Bazzana and Yaldiz (2010)", add
label define stu 4 "Beck et al. (2013)", add
label define stu 5 "Beck et al. (2006)", add
label define stu 6 "Beck et al. (2007)", add
label define stu 7 "Berger et al. (2008)", add
label define stu 8 "Boyd et al. (2006)", add
label define stu 9 "Cajueiro et al. (2012)", add
label define stu 10 "Andries and Capraru (2010)", add
label define stu 11 "Cihak et al. (2009)", add
label define stu 12 "Cihak and Schaeck (2012)", add
label define stu 13 " Cipollini and Fiordelisi (2009)", add
label define stu 14 "Hope et al. (2013)", add
label define stu 15 "Cihak and Hesse (2010)", add
label define stu 16 "Cihak and Schaeck (2008)", add
label define stu 17 "De Nicolo and Loukoianova (2007)", add
label define stu 18 "Fernandez & Garza-Garciab(2012)", add
label define stu 19 "Fu et al. (2014)", add
label define stu 20 "Jeon and Lim (2013)", add
label define stu 21 "Liu et al. (2010)", add
label define stu 22 "Liu and Wilson (2011)", add
label define stu 23 "Liu et al. (2012)", add
label define stu 24 "Machrouch et al. (2013)", add
label define stu 25 "Samantas (2013)", add
label define stu 26 "Turk-Ariss (2010)", add
label define stu 27 "Iskenderoglu and Tomak (2013)", add
label define stu 28 "Heimeshoff and Uhde (2009)", add
label define stu 29 "Fungcova and Weill (2009)", add
label define stu 30 "Micco and Yeyati (2007)", add
label define stu 31 "Deltuvaite (2012)", add
label values IDStudy stu
graph hbox PCC, over(IDStudy)

**************
**// Figure 3B
**************
mean PCC
mean PCCmed
mean PCC if reviewed_journal==1
hist PCC, addplot(pci 0 0.0089661 5.75 0.0089661 || pci 0 0.0178789 5.75 0.0178789 || pci 0 0.012018 5.75 0.012018)

**************
**// Figure 4B
**************
*Funnel plots
**A:all estimates
scatter invSEPCC PCC, msize(*.9) msymbol(Oh)
**B:Median estimates
scatter invSEPCCmed PCCmed, msize(*.9) msymbol(Oh)

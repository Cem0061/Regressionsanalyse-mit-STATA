/////Projekt_1/////
log using "Projekt_1.log", text replace
/////Aufgabe2////
////Abhängige Variabel bestimmen///
///Health Situation//
tab sphus_d, nol
replace sphus_d=. if sphus_d<=0
rename sphus_d Gesundheit
////Memoryscore///
tab memoryscore

////Unabhängige Variabel////

///Zahl der befragten Rentner///
tab cjs,

gen Rentner=.
replace retired = 1 if cjs == 1
replace retired = 0 if (cjs>1) | (cjs<1)
label variable retired "Person ist in Rente
label define retired 0 "Nicht in Rente" 1 "In Rente"
label values Rentner Renter



////// Namenänderung
////Alter der Befragen////
tab age
////BMI/////

gen BMI=.
replace BMI=1 if (bmi2==2)
replace BMI=0 if (bmi2!=2)
label variable BMI "Body Mass Index"
label define BMI 0 "ungesundes Body Mass Index" 1 "gesundes Body Mass Index"
label values BMI BMI
tab BMI
/////chronische Erkrankungen
replace chronic_mod=. if chronic_mod<0
/////////Finanzielle Lage im Haushalt im Hinblick auf Monatsende///
replace co007_=. if co007_<0
///////Arbeitsstunden in der Woche///

replace ep013_mod=. if ep013_mod<0
///////// Leiden an Depressionen
replace euro1=. if euro1<0
/////// Konzentration/////
replace euro10=. if euro10<0
//////////Raucher///////
replace ever_smoked=. if ever_smoked<0
///////////// Geschlecht/////////
tab female
///////Lebenslage///////
tab lifesat
///////Leben mit dem Partner zusammen///
tab partnerinhh
//// Regionen//////

order Gesundheit Rentner BMI chronic_mod co007_ ep013_mod  euro1 euro10 ever_smoked female lifesat partnerinhh

 reg Gesundheit Rentner BMI chronic_mod co007_ ep013_mod  euro1 euro10 ever_smoked female lifesat partnerinhh
 
 reg memoryscore Rentner BMI chronic_mod co007_ ep013_mod  euro1 euro10 ever_smoked female lifesat partnerinhh
 
 keep if e(sample)
cap log close
clear
exit
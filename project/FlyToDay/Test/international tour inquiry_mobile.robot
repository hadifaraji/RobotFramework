*** Settings ***
Documentation     خرید انواع تور
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../Setup/resources.robot
Resource          ../pages/Tour_page.robot


test Setup       Open Login Page Using Chrome Browser mobile

Test Teardown     Close Chrome Browser
*** Variables ***
${Username}      09382121662  
${password1}        Aa123456
${Tour_name}   css:[alt='تور آنتالیا']
${MOBILE_WIDTH}    375
${MOBILE_HEIGHT}   667


*** Test Cases ***
#### با تغییر نام ارگومان سایر تورها را نیز میشه بررسی کرد


tour reservation request mobile
     Given Login User   ${Username}  ${password1}
     when select tour  ${Tour_name}
     When Enter Passnger info
     Then Finalization of the tour inquiry by the agency


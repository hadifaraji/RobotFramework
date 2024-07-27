*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../Setup/resources.robot
Resource          ../pages/Tour_page.robot


test Setup       Open Login Page Using Chrome Browser app
Test Teardown     Close Chrome Browser
*** Variables ***
${Username}      09127988405  
${password1}        123456Aa

${Tour}    تور دبی
*** Test Cases ***
Dubai tour reservation request

     Given Login User   ${Username}  ${password1}
     when select tour
     When Select Dubai Tour  ${Tour}
     When Enter Passnger info
     Then Finalization of the tour inquiry by the agency
istanbul tour reservation request
     Given Login User   ${Username}  ${password1}
     when select tour
     When Select stanbul Tour
     When Enter Passnger info
     Then Finalization of the tour inquiry by the agency


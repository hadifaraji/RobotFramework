*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../Steps/Visa_Step.robot
Resource          ../Setup/resources.robot

Suite Setup       Open Login Page Using Chrome Browser app
Test Teardown     Close Chrome Browser
*** Variables ***
${Username}      09127988405  
${password1}        123456Aa
${First name}    احمذ
${Last name}     سازگار
${nationalId}    0440053153
${description}    من یک سرور در قسمت بار دارم حمل میکنم 
${travel card code}    UPZPTN3UNG
${discount code}    RISPJKVORB
${CityFrom}	       مشهد
${CityTo}	       تهران
${country visa}    ویزایایران
*** Test Cases ***
Successful purchase of an adult visa
     Given Login User   ${Username}  ${password1}
     When Go to the visa section
     When Select the country for the visa     ${country visa}
     When Enter passenger information    ${First name}     ${Last name}    ${nationalId}     ${Username}



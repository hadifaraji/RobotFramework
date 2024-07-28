*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../pages/Login_page.robot
Resource          ../Steps/Hotel_Step.robot
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
	

*** Test Cases ***
Domestic hotel reservation
     Given Login User       ${Username}  ${password1}
     Given Search for a hotel in the country
     When information of Iranian passengers Hotel    ${First name}    ${Last name}   ${nationalId}
     Then Confirmation and final payment of hotel reservation  ${description}


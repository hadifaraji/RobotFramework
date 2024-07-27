*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../Steps/Train_Step.robot
Resource          ../Setup/resources.robot
Resource          ../pages/profile_page.robot

Test Setup       Open Login Page Using Chrome Browser app
Test Teardown     Close Chrome Browser
*** Variables ***
${Username}      09127988405  
${password1}        123456Aa
${First name}    احمذ


*** Test Cases ***
create passenger in passenger book with minimal information
    Given Login User   ${Username}  ${password1}
    when Click on profile 
    and click my paasengers button
    and Entry of minimum passenger information
Edit passenger information
    Given Login User   ${Username}  ${password1}
    when Click on profile 
    and click my paasengers button
    and Edit passenger information
delete 1 passenger
    Given Login User   ${Username}  ${password1}
    when Click on profile 
    and click my paasengers button
    and delete passenger
delete all passengers
    Given Login User   ${Username}  ${password1}
    when Click on profile 
    and click my paasengers button
    delete all passenfers

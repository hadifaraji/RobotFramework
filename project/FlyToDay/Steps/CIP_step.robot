*** Settings ***
Library  SeleniumLibrary
Resource  ../Pages/CIP_page.robot
Resource  ../Steps/Login_Step.robot
Resource  ../Pages/Home_page.robot
Resource  ../Pages/Passenger_information.robot


*** Variables ***
${username}  09382121662
${password1}  Aa123456
${First name}  AL  
${Last name}   PACINO
${nationalId}  0020901984

*** Keywords ***
search Cip
    Login User    ${username}    ${password1}
    Click on Cip button
    choose airport
    choose Flight type
    click on search button


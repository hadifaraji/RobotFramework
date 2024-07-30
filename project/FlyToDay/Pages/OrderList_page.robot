*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
*** Variables ***

${SearchNumberOrder_Filed}                refOrder
${Search_Button}     css:.dashboard-common_searchBtn__BdsHZ
*** Keywords ***
Search number order
    [Arguments]         ${SearchNumberOrder}
    Wait Until Element Is Visible       ${SearchNumberOrder_Filed}
    Input Text           ${SearchNumberOrder_Filed}         ${SearchNumberOrder}
    Click Element        ${Search_Button}
    Wait Until Element Is Visible       //span[.='${SearchNumberOrder}']
    Click Element        //span[.='${SearchNumberOrder}']

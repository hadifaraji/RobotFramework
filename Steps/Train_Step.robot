*** Settings ***
Resource          ../pages/Home_page.robot
Resource          ../pages/Passenger_information.robot
Resource          ../pages/Payment_Information_page.robot
Resource          ../pages/Train_page.robot

*** Keywords ***
Domestic train ticket search
    [Arguments]         ${CityFrom}    ${CityTo}
    Click Train Tab
    Search Train       ${CityFrom}    ${CityTo}
    Select Tickect




*** Settings ***
Resource          ../pages/Visa_page.robot
Resource          ../pages/Passenger_information.robot
Resource          ../pages/Home_page.robot
*** Keywords ***
Go to the visa section
    Click More Tab
    Click Visa Tab
Select the country for the visa
     [Arguments]      ${country visa}
     Choosing a visa country      ${country visa}
     Select the tourist visa type
     Finalize the visa


Enter passenger information
     [Arguments]      ${First name}    ${Last name}   ${nationalId}  ${Mobile}
     Add passenger visa       ${First name}    ${Last name}   ${nationalId}  ${Mobile}



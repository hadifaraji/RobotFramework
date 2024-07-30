*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library        ../pages/python_resource.py
*** Variables ***
${delete_icon}    //div[@class='dashboard-common_list__6DfYC fw-500']/div[1]//button[@class='icon-trash-fill tw-ms-4 dashboard-common_actionButton__XYa1z dashboard-common_deleteButton__uCvLk button_defaultBtn__E53oA']
${add_passenger_button}  //button[@class='fs-7 button_secondaryBtn__Bygek']
${gender_icon}  //div[@class='popper_popper__uxti2 select-field_popper__7KB0A']/div[.='مرد']
${National_Code_box}  //input[@class='field_value__EXUsj field_withLabel__j0VNx text-field_input__e40ih fs-6 ltr-input']
${Information registration icon}  //button[@class='w-100 button_primaryBtn__dJOjt']
${ Edit_icon}  //div[@class='dashboard-common_list__6DfYC fw-500']/div[1]//button[@class='icon-edittwo-fill tw-ms-4 dashboard-common_actionButton__XYa1z button_defaultBtn__E53oA']
*** Keywords ***
Entry of minimum passenger information
    Wait Until Element Is Visible    ${add_passenger_button}
    Click Element    ${add_passenger_button}
    Input Text    nameFa    رضا
    Input Text    lastNameFa    نصیری
    Click Element    gender
    Wait Until Element Is Visible    ${gender_icon}
    Click Element    ${gender_icon}
  ${National_Code}  National Code Generator
    Input Text   ${National_Code_box}    ${National_Code}
    Click Element    ${Information registration icon}
    Sleep    5

delete passenger
    Wait Until Element Is Visible    ${delete_icon}
    Click Element    ${delete_icon}
    Wait Until Element Is Visible    css:.tw-me-1
    Click Element    css:.tw-me-1
    Sleep    5


delete all passenfers
    Sleep    3
    ${isVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${delete_icon}    timeout=10s

    WHILE    ${isVisible} == True
        delete passenger
        ${isVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${delete_icon}    timeout=10s
    END
  
Edit passenger information
    Wait Until Element Is Visible    ${ Edit_icon}
    Click Element    ${ Edit_icon}
    Click Element    nameFa
    Clear Element Text    nameFa
    Press Keys    nameFa    علی
    Click Element    lastNameFa
    Clear Element Text    lastNameFa
    Press Keys    lastNameFa    جعفری
    Click Element    gender
    Wait Until Element Is Visible    ${gender_icon}
    Click Element    ${gender_icon}
    Click Element    ${Information registration icon}
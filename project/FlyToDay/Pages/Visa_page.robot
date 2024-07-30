*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${Visa type_ComboBox}          visaType
${tourist_Item}    css:.option_selectOption__T1yUy
${Finalize_Button}       css:.button_primaryBtn__dJOjt.tw-mt-6
*** Keywords ***
Choosing a visa country
      [Arguments]      ${country visa}
      Sleep   2
      Wait Until Element Is Visible    //h3[.='${country visa}']
      Click Element          //h3[.='${country visa}']
Select the tourist visa type
       Wait Until Element Is Visible    ${Visa type_ComboBox}
       Click Element    ${Visa type_ComboBox}
       Wait Until Element Is Visible    ${tourist_Item}
       Click Element    ${tourist_Item}
Finalize the visa
       Wait Until Element Is Visible    ${Finalize_Button}
       Click Element    ${Finalize_Button}

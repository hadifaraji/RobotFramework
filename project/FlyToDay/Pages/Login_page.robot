*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
*** Variables ***
${Login_Btn}         xpath://span[.='ورود']
${Username_Field}    emailOrMobile
${Next_Button}       css:.authentication_btnAuth__WVPok
${Password_Field}    pass
${Submit_Button}     css:[data-test='login-btn']
*** Keywords ***
Click Login Button
      Click Element  ${Login_Btn}
Input Username 
    [Arguments]      ${username}
      Wait Until Element Is Visible   ${Username_Field}
      Input Text     ${Username_Field}    ${username}
      Click Element  ${Next_Button} 
Input Password 
    [Arguments]      ${password}
      Wait Until Element Is Visible  ${Password_Field}        timeout=10
      Input Text     ${Password_Field}    ${password}
Submit Credentials
      Click Element   ${Submit_Button}
      Sleep    3



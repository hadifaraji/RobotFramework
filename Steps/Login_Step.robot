*** Settings ***
Resource          ../pages/Login_page.robot
*** Keywords ***
Login User
    [Arguments]           ${username}   ${Password}  
    Click Login Button
    Input Username        ${username}
    Input Password        ${password}
    Submit Credentials
Login User Guest
    [Arguments]           ${username}   ${Password}  
    Input Username        ${username}
    Input Password        ${password}
    Submit Credentials
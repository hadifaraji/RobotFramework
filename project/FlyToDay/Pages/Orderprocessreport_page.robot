*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
#-----------------Status------------------
${Ticket issued_Status}            css:.greenStatus
${The ticket has been cancelled_Status}   css:.redStatus
${Issuing purchased tickets_Status}       css:.blueStatus
${SearchNumberOrder_Filed}                refOrder
${Username_Field}    emailOrMobile
${Next_Button}       css:.authentication_btnAuth__WVPok
${Password_Field}    pass
${Submit_Button}     css:[data-test='login-btn']

*** Keywords ***
Check Status Change
   #  Sleep   6
    #Switch Window    new
    #Sleep   2
    #${NEW_WINDOW}    Get Window Handles
    #Sleep    6
  #  ${WINDOWS}    Get Window Handles
   # ${NEW_WINDOW}    Evaluate    len(${WINDOWS}) > 1
   # Run Keyword If    '${NEW_WINDOW}' == 'True'    Switch Window    ${WINDOWS[1]}
    ${NEW_WINDOW}    Get Window Handles
    Sleep    10
    ${WINDOWS}    Get Window Handles
    ${NEW_WINDOW}    Evaluate    len(${WINDOWS}) > 1
    Run Keyword If    '${NEW_WINDOW}' == 'True'    Switch Window    ${WINDOWS[1]}
    Switch Window    ${new_window}
    Wait Until Element Contains     ${Ticket issued_Status}    صادر شده      timeout=30s
    Wait Until Element Is Visible       //button[@class='dashboard_orderDetailBtnFlight__3pYcZ tw-w-full button_secondaryBtn__Bygek']
    Click Element    //button[@class='dashboard_orderDetailBtnFlight__3pYcZ tw-w-full button_secondaryBtn__Bygek']
    Wait Until Element Is Visible          //div[@class='checkbox-with-logo_styledCheckbox__ZHJ5Y checkbox-with-logo_styledUnCheckboxChecked__OzoWX ']
    Click Element    //div[@class='checkbox-with-logo_styledCheckbox__ZHJ5Y checkbox-with-logo_styledUnCheckboxChecked__OzoWX ']
     Wait Until Element Is Enabled    //button[@class='w-100 button_primaryBtn__dJOjt']      timeout=30
    Click Element    //button[@class='w-100 button_primaryBtn__dJOjt']
    Wait Until Element Is Enabled    css:.button_primaryBtn__dJOjt.w-100           timeout=30
    Click Element    css:.button_primaryBtn__dJOjt.w-100
    Wait Until Element Is Visible    //button[contains(.,'متوجه شدم')]
    Click Element                   //button[contains(.,'متوجه شدم')]
Check Status Change1
 #   ${initial_window}    Get Window Handles
  #  Wait Until Keyword Succeeds    10x    Sleep    1s    Evaluate    len(Get Window Handles()) > 1
   # ${all_windows}    Get Window Handles
    #${new_window}    Evaluate    [w for w in ${all_windows} if w != '${initial_window}'][0]
    #Switch Window    ${new_window}

   # Wait Until Element Contains     ${Ticket issued_Status}    صادر شده      timeout=30s
    Wait Until Element Is Visible       //button[@class='dashboard_orderDetailBtnFlight__3pYcZ tw-w-full button_secondaryBtn__Bygek']    timeout=5
    Click Element    //button[@class='dashboard_orderDetailBtnFlight__3pYcZ tw-w-full button_secondaryBtn__Bygek']
    Wait Until Element Is Visible          //div[@class='checkbox-with-logo_styledCheckbox__ZHJ5Y checkbox-with-logo_styledUnCheckboxChecked__OzoWX ']
    Click Element    //div[@class='checkbox-with-logo_styledCheckbox__ZHJ5Y checkbox-with-logo_styledUnCheckboxChecked__OzoWX ']
     Wait Until Element Is Enabled    //button[@class='w-100 button_primaryBtn__dJOjt']      timeout=30
    Click Element    //button[@class='w-100 button_primaryBtn__dJOjt']
    Wait Until Element Is Enabled    css:.button_primaryBtn__dJOjt.w-100           timeout=30
    Click Element    css:.button_primaryBtn__dJOjt.w-100
    Wait Until Element Is Visible    //button[contains(.,'متوجه شدم')]
    Click Element                   //button[contains(.,'متوجه شدم')]
Checking the status of ticket issuance
        Wait Until Element Is Visible      ${Issuing purchased tickets_Status}      timeout=20s
        ${current_status} =    Get Text    ${Issuing purchased tickets_Status}
        Wait Until Keyword Succeeds    20s    1s    Check Status Change    ${current_status}

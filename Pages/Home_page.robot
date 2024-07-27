*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables *** 
${train_Tab}                  css:[data-test='service-tab-train'] > .tabs_text__7p1gI
${insurance_Tab}              css:[data-test='service-tab-insurance'] > .tabs_text__7p1gI
${internationalHotel_Tab}     css:[data-test='service-tab-international-hotel'] > .tabs_text__7p1gI
${domesticHotel_Tab}          css:[data-test='service-tab-domestic-hotel'] > .tabs_text__7p1gI
${internationalFlight_Tab}    //li[.='پرواز خارجی']
${domesticFlight_Tab}         css:[data-test='service-tab-domestic-flight'] > .tabs_text__7p1gI
*** Keywords ***
Wait Until Element Is Clickable
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Element Should Be Clickable    ${locator}
Element Should Be Clickable
    [Arguments]    ${locator}
    ${element_visible}    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    Run Keyword If    ${element_visible}    Click Element    ${locator}
    ...    ELSE
    ...    Log    Element ${locator} is not visible or clickable.
Click Train Tab
      Wait Until Element Is Visible   ${train_Tab}
      Scroll Element Into View        ${train_Tab}
      Click Element  ${train_Tab}
Click insurance Tab
      Wait Until Element Is Visible   ${insurance_Tab}
      Click Element  ${insurance_Tab}
Click international Hotel Tab
      Wait Until Element Is Visible   ${internationalHotel_Tab}
      Click Element  ${internationalHotel_Tab}
Click domestic Hotel Tab
      Wait Until Element Is Visible   ${domesticHotel_Tab}
      Click Element  ${domesticHotel_Tab}
Click international Flight Tab
      Wait Until Element Is Visible   ${internationalFlight_Tab}
      Wait Until Keyword Succeeds    10s    1s    Element Should Be Clickable    ${Paying for the ticket_Button}

   #   Execute JavaScript    document.querySelector('li[data-test="service-tab-international-flight"]').click();

      Click Element  ${internationalFlight_Tab}
Click domestic Flight Tab
      Wait Until Element Is Visible   ${domesticFlight_Tab}
      Click Element  ${domesticFlight_Tab}

Click on profile 
    Wait Until Element Is Visible    css:.nav_username__7OxpS
    Click Element    css:.nav_username__7OxpS
    Wait Until Element Is Visible    //div[.='پروفایل']
    Click Element    //div[.='پروفایل']
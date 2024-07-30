*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary



*** Variables ***
${Flight-Domestic_Part}     css:[data-test='service-tab-domestic-flight'] > .tabs_text__7p1gI     #Flight-Domestic
${One way_ComboBox}         xpath://span[.='یک طرفه']
${RoundTrip_ComboBox}       css:[data-test='Return']
${End-date_Filed}           css:[data-test='end-date-field'] .field_label__TwY5y
${Select end date}          css:[data-test='calendarDay-0-29'] .day_dayNumber__JF5Iy
${Confirmed end date}          css:.new_contained__osHEL 
${cabinType_ComboBox}       xpath://span[.='اکونومی']

${From_Button}              //span[.='مبدا']
${FromSearch_Filed}       css:[placeholder='جستجوی مبدا']
${FromSelect_Button}        css:*[data-test=\"thr\"]
${To_Button}                css:.autocomplete_autocomplete__WQES9:nth-child(3) .field_labelValueWrapper__Xvf3_
${ToSelect_Button}          css:*[data-test=\"mhd\"]
${ToSearch_Filed}       css:[placeholder='جستجوی مقصد']
${ToSelect_Button}       css:[data-test='ist']

${Search_Button}           //*[contains(text(), 'جستجو')]
#--------------------------------
${Details and purchase mobile_Button}     //div[@class="route-airline-name_airlineWrapper__57KK0 mt-md-2"]
${Details and purchase_Button}            css:#general-itineraries-container > div > div:nth-of-type(1) .itinerary_chooseTicketButton__OQlPT
${Buy tickets_Button}                     css:.flight-details_chooseTicketButton__PAFU8
#--------------------------Click part international flight-------------------

${Part international_menu}      css:[data-test='service-tab-international-flight'] > .tabs_text__7p1gI
#----------------------------Number of passengers---------------------------------------
${Number of passengers_menu}        //span[.='مسافران']
${PlusChild_ButtonIcon}             css:[data-test='increment-children']
${PlusChild_ButtonIconMobile}      css:.flex-1.pt-1 > div:nth-of-type(2) .icon-plus
${PlusBaby_ButtonIcon}         css:.px-4.pt-3 > div:nth-of-type(3) .icon-plus
${PlusChild_ButtonIconMobile_ButtonIcon}     css:[data-test='increment-infants']
${Plusadult_ButtonIcon}        css:.px-4.pt-3 > div:nth-of-type(1) .icon-plus
${Confirm the number of passengers_ButtonIcon}        css:.new_newButton__gm0Gv
#-----------------------------------


${International_PartMobile}   //div[.='پرواز خارجی']

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

Click Element Safely
    [Arguments]    ${locator}
    ${retry_count}=    Set Variable If    ${retry_count}
#..................................................mobile...........................
Select Tickect Mobile
      Wait Until Element Is Visible   ${Details and purchase mobile_Button}     timeout=50
      Scroll Element Into View        ${Details and purchase mobile_Button}
      Click Element  ${Details and purchase mobile_Button}
      Wait Until Element Is Visible   ${Buy tickets_Button}     timeout=20
      Click Element  ${Buy tickets_Button}
      Sleep  4

Click Flight Mobile
       Wait Until Element Is Enabled    //span[.='پرواز']    timeout=20s
       Click Element      //span[.='پرواز']

Click international Flight Part Mobile
       Wait Until Element Is Enabled    ${International_PartMobile}    timeout=20s
       Click Element     ${International_PartMobile}

#.............................................................
Select End-date
      Wait Until Element Is Visible   ${End-date_Filed}
      Click Element  ${End-date_Filed}
      Wait Until Element Is Visible   ${Select end date}
      Click Element  ${Select end date}
      Wait Until Element Is Visible    ${Confirmed end date}
      Click Element  ${Confirmed end date}      
Change Flight Trip Type RoundTrip
      Sleep    4
      Wait Until Element Is Visible   ${One way_ComboBox}
      Wait Until Element Is Enabled    ${one_way_combo_box}    timeout=10s
      Click Element  ${One way_ComboBox}
      Wait Until Element Is Visible   ${RoundTrip_ComboBox}
      Click Element  ${RoundTrip_ComboBox}
Select Type Flight International
      Wait Until Element Is Enabled    xpath://span[.='پرواز']    timeout=10s
      Click Element    xpath://span[.='پرواز']
      Wait Until Element Is Visible  css:[data-test='service-tab-international-flight']
      Click Element  css:[data-test='service-tab-international-flight']
Search domestic flight

      [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
    #  Sleep   2
    ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://span[.='پرواز']    timeout=5s
    Run Keyword If    ${element_d_found}
    ...    Click Element    xpath://span[.='پرواز']
    ...    ELSE
    #...    Wait Until Element Is Visible        ${From_Button}   timeout=40
    ...    Log    "Windows"
      Wait Until Element Is Visible    ${From_Button}         timeout=10

      Click Element    ${From_Button}
      Wait Until Element Is Visible    ${FromSearch_Filed}         timeout=10
      Click Element  ${FromSearch_Filed}
      Sleep      1
      Input Text     ${FromSearch_Filed}       ${FromCity}
      Wait Until Element Is Visible   //p[.='همه فرودگاه‌های ${FromCity} (${FromCode_City})']       timeout=10
      Click Element  //p[.='همه فرودگاه‌های ${FromCity} (${FromCode_City})']
      Sleep    2
      Click Element  ${To_Button}
      Wait Until Element Is Visible    ${ToSearch_Filed}          timeout=20
      Click Element  ${ToSearch_Filed}
      Sleep      1
      Input Text     ${ToSearch_Filed}     ${ToCity}
      Wait Until Element Is Visible   //p[.='همه فرودگاه‌های ${ToCity} (${ToCode_City})']      timeout=20
      Click Element  //p[.='همه فرودگاه‌های ${ToCity} (${ToCode_City})']
Select Tickect
     ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Details and purchase_Button}   timeout=50s
     Run Keyword If    ${element_d_found}
     ...    Click Element    ${Details and purchase_Button}
     ...   ELSE
#     ...   Wait Until Element Is Visible   ${Details and purchase mobile_Button}
     ...   Click Element     ${Details and purchase mobile_Button}
       Wait Until Element Is Visible   ${Buy tickets_Button}     timeout=15
       Click Element  ${Buy tickets_Button}
       Sleep  4

Search Flight Internaitional

      Sleep    3
      Wait Until Element Is Visible    ${From_Button}         timeout=10
      Click Element  ${From_Button}
      Wait Until Element Is Visible    ${FromSearch_Filed}         timeout=10
      Click Element  ${FromSearch_Filed}
      Sleep      1
      Input Text     ${FromSearch_Filed}        تهران
      Wait Until Element Is Visible   ${FromSelect_Button}       timeout=10
      Click Element  ${FromSelect_Button}
      Sleep    2
      Click Element  ${To_Button}
      Wait Until Element Is Visible    ${ToSearch_Filed}          timeout=20
      Click Element  ${ToSearch_Filed}
      Sleep      1
      Input Text     ${ToSearch_Filed}     استانبو
      Wait Until Element Is Visible   //p[.='همه فرودگاه‌های استانبول (IST)']      timeout=20
      Click Element  //p[.='همه فرودگاه‌های استانبول (IST)']
Finalize the search
      Click Element      //button[contains(text(), 'جستجو')]


Add a child passenger list
      Wait Until Element Is Visible    ${Number of passengers_menu}
      Click Element     ${Number of passengers_menu}
    ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${PlusChild_ButtonIconMobile}    timeout=5s
    Run Keyword If    ${element_d_found}
    ...    Click Element   ${PlusChild_ButtonIconMobile}
    ...    ELSE
   # ...    Wait Until Element Is Visible     ${PlusChild_ButtonIcon}
    ...    Click Element    ${PlusChild_ButtonIcon}
      Click Button     ${Confirm the number of passengers_ButtonIcon}
      Sleep   2
Add a Baby passenger list
      Wait Until Element Is Visible    ${Number of passengers_menu}
      Click Element     ${Number of passengers_menu}
        ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${PlusBaby_ButtonIcon}    timeout=5s
      Run Keyword If    ${element_d_found}
      ...    Click Element   ${PlusBaby_ButtonIcon}
      ...    ELSE
      ...     Click Element        ${PlusChild_ButtonIconMobile_ButtonIcon}
     #  Wait Until Element Is Visible     ${PlusBaby_ButtonIcon}
      # Click Element         ${PlusBaby_ButtonIcon}
       Click Button     ${Confirm the number of passengers_ButtonIcon}
Add Adult passenger list
      Click Element     ${Number of passengers_menu}
      Wait Until Element Is Visible     ${Plusadult_ButtonIcon}
      Click Button    ${Plusadult_ButtonIcon}
      Click Button     ${Confirm the number of passengers_ButtonIcon}

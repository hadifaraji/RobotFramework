*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***

${CityFrom_Menu}         css:.autocomplete_autocomplete__WQES9 .field_labelValueWrapper__Xvf3_
${Tehran_Items}          //p[.='تهران، تهران، ایران']
${Search_Button}         //button[@class="search-button tw-mt-2 mt-md-0 button_primaryBtn__dJOjt"]
${PartDomesticHotel}     css:.tabs_tabs__bXQKN > li:nth-of-type(3) > .tabs_text__7p1gI
${Select Hotel_Button}   css:[data-test='show-rooms-0']
*** Keywords ***
Domestic hotel search
      Wait Until Element Is Visible    ${PartDomesticHotel}
      Click Element    ${PartDomesticHotel}
      Wait Until Page Contains Element    ${CityFrom_Menu}
      Click Element    ${CityFrom_Menu}
      Wait Until Page Contains Element    ${Tehran_Items}
      Click Element  ${Tehran_Items}
      Wait Until Page Contains Element    ${Search_Button}
      Click Element  ${Search_Button}
Select First Hotel
      Wait Until Element Is Visible    ${Select Hotel_Button}    timeout=30
      Click Element    ${Select Hotel_Button}
      Sleep     5
      ${handles}=    Get Window Handles
      Switch Window    ${handles}[1]
      Sleep     5
      Execute JavaScript    window.scrollBy(0, 500)
Reservation inquiry

      Wait Until Page Contains Element    //button[@class="fs-7 w-100 px-4 button_primaryBtn__dJOjt"]
      Scroll Element Into View          //button[@class="fs-7 w-100 px-4 button_primaryBtn__dJOjt"]
      Click Element    //button[@class="fs-7 w-100 px-4 button_primaryBtn__dJOjt"]
      Wait Until Element Is Visible    //button[@class="w-100 px-4 button_primaryBtn__dJOjt"]    timeout=5
      Click Element    //button[@class="w-100 px-4 button_primaryBtn__dJOjt"]
Select International Part
       Wait Until Element Is Visible       css:[data-test='service-tab-international-hotel'] > .tabs_text__7p1gI
      Click Element                        css:[data-test='service-tab-international-hotel'] > .tabs_text__7p1gI

International hotel search
       [Arguments]           ${City}
     Wait Until Element Is Visible   //span[.='نام شهر، هتل یا منطقه']    timeout=5
     Click Element    //span[.='نام شهر، هتل یا منطقه']
     Input Text       css:[placeholder='جستجوی شهر یا هتل']        ${City}
     Wait Until Element Is Visible   //p[.='United Arab Emirates']    timeout=15
     Click Element    //p[.='United Arab Emirates']
     Click Element    css:.search-button



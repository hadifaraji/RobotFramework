*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${trainOriginStation_Combobox}       css:[data-test='trainOriginStation'] > .field_labelValueWrapper__Xvf3_
${trainOriginStation_ComboboxSearch}       css:[placeholder='جستجوی مبدا']
${trainDestinationStation_Combobox}  css:[data-test='trainDestinationStation'] > .field_labelValueWrapper__Xvf3_
${trainDestinationStation}       css:[placeholder='جستجوی مقصد']
${Search_Button}     css:.search-button
${Details and purchase_Button}        //button[@class="d-none d-md-block w-100 tw-mt-2 tw-mb-1 itinerary_chooseButton__x1Dbs button_primaryBtn__dJOjt"]
${Buy tickets_Button}                 css:.itinerary_chooseTicketButton__RoXTC
*** Keywords ***
Search Train
    [Arguments]     ${CityFrom}   ${CityTo}
      Wait Until Element Is Visible   ${trainOriginStation_Combobox}
      Click Element                   ${trainOriginStation_Combobox}
      Wait Until Element Is Visible   ${trainOriginStation_ComboboxSearch}
      Click Element  ${trainOriginStation_ComboboxSearch}
      Input Text     ${trainOriginStation_ComboboxSearch}       ${CityFrom}
      Click Element   //p[.='${CityTo}']
      Sleep     2
      Wait Until Element Is Visible   ${trainDestinationStation_Combobox}
      Click Element                   ${trainDestinationStation_Combobox}
      Wait Until Element Is Visible   ${trainDestinationStation_Combobox}
      Click Element  ${trainDestinationStation}
      Input Text     ${trainDestinationStation}       ${CityTo}
      Click Element   //p[.='${CityFrom}']
      Click Button    ${Search_Button}
Select Tickect
      Sleep  5
      Click Button    //button[@class="d-none d-md-block w-100 tw-mt-2 tw-mb-1 itinerary_chooseButton__x1Dbs button_primaryBtn__dJOjt"]
      Click Element    //button[@class="fs-6 flex-1 itinerary_chooseTicketButton__RoXTC button_primaryBtn__dJOjt"]
      Click Element    //button[@class="w-100 fs-7 button_primaryBtn__dJOjt"]


*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Resource        ../Pages/Flight_page.robot
Resource    Home_page.robot
*** Variables ***
${Details_and_purchase_button}   //button[@class='tw-none tw-my-2 md:tw-block tw-w-full itinerary_chooseButton__x1Dbs button_primaryBtn__dJOjt']
${buy_cip_button}  //button[@class='tw-w-[220px] tw-h-11 button_primaryBtn__dJOjt']
${airoirt_span}        //span[.='فرودگاه']
${flight_type_span}  //span[@class='field_label__TwY5y field_label__9Do0O']
*** Keywords ***
choose airport
    Wait Until Element Is Visible    ${airoirt_span}
    Click Element    ${airoirt_span}
    Wait Until Element Is Visible  (//div[@class='option_autocompleteOption__vJ6SE'])[1]
    Click Element    (//div[@class='option_autocompleteOption__vJ6SE'])[1]

choose Flight type
    Wait Until Element Is Visible    ${flight_type_span}
    Click Element    ${flight_type_span}
    Wait Until Element Is Visible  (//*[@class='tw-px-6 md:tw-py-1 md:tw-px-4 tw-h-10 xl:tw-w-[305px] tw-flex tw-items-center tw-text-primaryBlack tw-font-medium tw-cursor-pointer hover:tw-bg-blueRoyal-100 sm:tw-py-1 sm:tw-px-0'])[1]
    Click Element    (//*[@class='tw-px-6 md:tw-py-1 md:tw-px-4 tw-h-10 xl:tw-w-[305px] tw-flex tw-items-center tw-text-primaryBlack tw-font-medium tw-cursor-pointer hover:tw-bg-blueRoyal-100 sm:tw-py-1 sm:tw-px-0'])[1]
click on search button
    Wait Until Element Is Visible    ${Search_Button}
    Click Button   ${Search_Button}

Choose between results
    Sleep    10
    Wait Until Page Contains Element   ${Details_and_purchase_button}
    Click Button       ${Details_and_purchase_button}
    Wait Until Element Is Visible    ${buy_cip_button}    
    Click Button   ${buy_cip_button}
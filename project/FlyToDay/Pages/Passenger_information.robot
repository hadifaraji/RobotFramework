*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library        ../pages/python_resource.py
Library    XML
*** Variables ***
#--------------------------------
${Details and purchase_Button}            css:#general-itineraries-container .itinerary_ticketChooseSection__0StDZ [data-test='show-flight-more-detail-0']
${Buy tickets_Button}                     css:.flight-details_chooseTicketButton__PAFU8
#-------passenger ---------
${passengerFirstName_Field}            passengerFirstName
${passengerLastName_Field}             passengerLastName
${nationalId_Field}                    nationalId
${dateOfBirth-form}                    dateOfBirth



${dateOfBirthDayMobile-form}           css:.css-17s22kg-control
${dateOfBirthMonthMobile-form}         css:.css-1xhcotz-control
${dateOfBirthYearMobile-form}          css:.css-xsonp6-control


${dateOfBirthDay-form}                 css:.css-6gq4gv-control .css-1hoxxid
${dateOfBirthDay2-form}                react-select-2-option-2
${dateOfBirthMonth-form}               css:.css-1xhcotz-control .css-1hoxxid
${dateOfBirthMonth2-form}              react-select-3-option-0
${dateOfBirthYear-form}                css:.css-xsonp6-control .css-1xc3v61-indicatorContainer
${dateOfBirthYear2-form}               react-select-4-option-2
${dateOfBirthSubmit_Button}            css:[data-test='wheePickerSelectDate']
#---------------------cancellation-policies-----------
${Normal cancellation_Button}          css:.radio-button_radioCircle__6_Nsy 
${Return without penalty cancellation_Button}      xpath://span[.='استرداد بدون جریمه']  
#--------------------
${Continue the purchase process_Bottun}   css:[type='primary']
#----------------------- Select Passengers' notebook----------------------
${PassengersNotebook_Button}             //button[@class='px-2 px-md-3 tw-my-0 passenger-information-panel_passengersBooklet__QPrXJ button_secondaryBtn__Bygek']
${User Passengers' notebook_Button}       css:.add-passenger_btn__ltrGt
${User Passengers' notebookMobile_Button}       css:.add-passenger_mobileRow__tEv57
#---------------------------- datefPassport ---------------------
${passport_Field}             passportNumber
${dateOfPassport-form}           css:.tw-text-gray-400
${dateOfPassport-form}                    dateOfBirth
${dateOfPassportDay-form}                 css:.css-6gq4gv-control .css-1hoxxid
${dateOfPassportDay2-form}                //div[@id="react-select-5-option-1"]
${dateOfPassportMonth-form}               css:.css-1xhcotz-control .css-1hoxxid
${dateOfPassportMonth2-form}             //div[@id="react-select-6-option-1"]
${dateOfPassportYear-form}                css:.css-xsonp6-control .css-1xc3v61-indicatorContainer
${dateOfPassportYear2-form}               //div[@id="react-select-7-option-2"]
${dateOfPassportSubmit_Button}            css:[data-test='wheePickerSelectDate']


#--------------------------------------------------------------------
${passengerFirstNameHotel_Field}               //input[@name="passengerFirstName-0-0"]
${passengerLastNameHotel_Field}                //input[@name="passengerLastName-0-0"]
${nationalIdHotel_Field}                       //input[@name="nationalId-0-0"]
${Confirm and continueHotel_Button}            //button[@class="tw-w-full xs:tw-max-w-[300px] tw-h-12 tw-ms-auto button_primaryBtn__dJOjt"]
${passengerBookChild_Button}        css:[data-test='show-passengers-modal-button-Chd-0']
${passengerBookAdult_Button}        css:[data-test='show-passengers-modal-button-Adt-0']
${passengerBookBaby_Button}         css:[data-test='show-passengers-modal-button-Inf-0']


#--------------------------Country  passenger----------------------------
${Passport Country_Combobox}        //span[@class="tw-ms-1 form-country-select_countryName__Rdss_"]
${Passport Country_SearchCombobox}        css:[placeholder='نام کشور']
${Passport Country_SelectCombobox}         //div[@class="form-country-select_country__VGBO_ false pointer"]

#----------------------------Passnger visa-------
${passengerFirstNameVisa_Field}      passengerFirstName-Adt-0
${passengerLastNameVisa_Field}       passengerLastName-Adt-0 
${passengerNationalIdVisa_Field}              nationalCode-Adt-0
${MobileVisa_Field}                  mobile-Adt-0
#----------------------------     cip      ----------------------------
${name_span}  //span[.='نام لاتین']
${cip_name_input}  Adt.0.firstName 
${cip_family_input}  Adt.0.lastName
${cip_nationalId_input}  Adt.0.nationalId
${airline_box}  //span[@class='field_label__TwY5y field_label__9Do0O']
${cip_Continue_the_purchase_process}  css:.tw-h-12
${Approval of regulations}  xpath=(//div[@class="checkbox-with-logo_styledCheckbox__ZHJ5Y checkbox-with-logo_styledUnCheckboxChecked__OzoWX "])[3]
${confirm and pay}  css:.tw-h-12
${first_airline}  (//div[@class="option_autocompleteOption__vJ6SE option_noCaptionOption__1nnA7"])[1]
${Flight number and destination airport}   //button[@name='flightNumberAndAirport']/div[@class='field_labelValueWrapper__Xvf3_']
${First_Flight_number}  (//div[@class="option_selectOption__T1yUy"])[1]
${XPATH_SELECTOR}  //svg[@class="checkbox-with-logo_icon__ZwD1n"]

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
#........................Mobile.....................
information of Iranian passengers Mobile
          [Arguments]      ${First name}    ${Last name}   ${nationalId}
       Execute JavaScript    window.scrollBy(0, 500)

      Wait Until Element Is Visible   ${passengerFirstName_Field}     timeout=20
      Input Text       ${passengerFirstName_Field}      ${First name}
      Input Text       ${passengerLastName_Field}      ${Last name}
      Input Text       ${nationalId_Field}      ${nationalId}

      Click Element    ${dateOfBirth-form}
      Wait Until Element Is Visible   ${dateOfBirthDayMobile-form}
      Click Element    ${dateOfBirthDayMobile-form}
      Click Element    ${dateOfBirthDay2-form}
      Wait Until Element Is Visible   ${dateOfBirthMonthMobile-form}
      Click Element    ${dateOfBirthMonthMobile-form}
      Click Element    ${dateOfBirthMonth2-form}
      Wait Until Element Is Visible   ${dateOfBirthYearMobile-form}
      Click Element    ${dateOfBirthYearMobile-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
      
Enter the information of the foreign passenger Mobile
          [Arguments]      ${First name}    ${Last name}    ${PassportId}   ${Country}
      Sleep   3
      Execute JavaScript    window.scrollBy(0, 300)

      Wait Until Element Is Visible   ${passengerFirstName_Field}    timeout=25
      Input Text       ${passengerFirstName_Field}      ${First name}
      Input Text       ${passengerLastName_Field}      ${Last name}

      Click Element    ${Passport Country_Combobox}
      Wait Until Element Is Visible   ${Passport Country_SearchCombobox}
      Click Element    ${Passport Country_SearchCombobox}
      Input Text     ${Passport Country_SearchCombobox}       ${Country}
      Wait Until Element Is Visible   ${Passport Country_SelectCombobox}
      Click Element    ${Passport Country_SelectCombobox}
      Wait Until Element Is Visible   ${passport_Field}
      Input Text       ${passport_Field}      ${PassportId}
     Click Element    ${dateOfBirth-form}
      Wait Until Element Is Visible   ${dateOfBirthDayMobile-form}
      Click Element    ${dateOfBirthDayMobile-form}
      Click Element    ${dateOfBirthDay2-form}
      Wait Until Element Is Visible   ${dateOfBirthMonthMobile-form}
      Click Element    ${dateOfBirthMonthMobile-form}
      Click Element    ${dateOfBirthMonth2-form}
      Wait Until Element Is Visible   ${dateOfBirthYearMobile-form}
      Click Element    ${dateOfBirthYearMobile-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
      Sleep   2
      Click Element    css:[name='passportExpiryDate'] > .field_labelValueWrapper__Xvf3_
      Wait Until Element Is Visible       css:.css-17s22kg-control
      Click Element    css:.css-17s22kg-control
      Click Element    ${dateOfPassportDay2-form}
      Click Element    css:.css-1xhcotz-control
      Click Element    ${dateOfPassportMonth2-form}
      Click Element    css:.css-xsonp6-control
      Click Element    ${dateOfPassportYear2-form}
      Click Element    ${dateOfPassportSubmit_Button}      
    #-------------------------------------------------------------------------------
information of Iranian passengers Hotel
          [Arguments]      ${First name}    ${Last name}   ${nationalId}
      Wait Until Element Is Visible   ${passengerFirstNameHotel_Field}    timeout=30

      Scroll Element Into View       ${passengerFirstNameHotel_Field}
      Execute JavaScript    window.scrollBy(0, 300)
      Wait Until Element Is Visible   ${passengerFirstNameHotel_Field}
      Input Text       ${passengerFirstNameHotel_Field}      ${First name}
      Input Text       ${passengerLastNameHotel_Field}      ${Last name}
      Input Text       ${nationalIdHotel_Field}      ${nationalId}
      Click Element    (//div[@class="field_labelValueWrapper__Xvf3_"])[7]
      Wait Until Element Is Visible   css:.popper_popper__uxti2 > div:nth-of-type(1)
      Click Element    css:.popper_popper__uxti2 > div:nth-of-type(1)
      Scroll Element Into View       ${Confirm and continueHotel_Button}
      Wait Until Element Is Visible   ${Confirm and continueHotel_Button}
      Click Element   ${Confirm and continueHotel_Button}

information of Iranian passengers
          [Arguments]      ${First name}    ${Last name}   ${nationalId}
      Wait Until Element Is Visible   ${passengerFirstName_Field}     timeout=20
      Input Text       ${passengerFirstName_Field}      ${First name} 
      Input Text       ${passengerLastName_Field}      ${Last name}
      Input Text       ${nationalId_Field}      ${nationalId}
      Click Element    dateOfBirth
     ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthDay-form}   timeout=20s
    Run Keyword If    ${element_d_found}
    ...    Click Element    ${dateOfBirthDay-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthDayMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthDay2-form}  timeout=2
      Click Element    ${dateOfBirthDay2-form} 
     ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthMonth-form}   timeout=20s
    Run Keyword If    ${element_d1_found}
    ...    Click Element    ${dateOfBirthMonth-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthMonthMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthMonth2-form}
      Click Element    ${dateOfBirthMonth2-form}

           ${element_d2_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthYear-form}   timeout=20s
    Run Keyword If    ${element_d2_found}
    ...    Click Element    ${dateOfBirthYear-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthYearMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
information of Iranian passengers with passport
          [Arguments]      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
      Wait Until Element Is Visible   ${passengerFirstName_Field}    timeout=25
      Input Text       ${passengerFirstName_Field}      ${First name}
      Input Text       ${passengerLastName_Field}      ${Last name}
      Input Text       ${nationalId_Field}      ${nationalId}
      Input Text       ${passport_Field}      ${PassportId}
      Click Element    ${dateOfBirth-form}
      ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthDay-form}   timeout=20s
    Run Keyword If    ${element_d_found}
    ...    Click Element    ${dateOfBirthDay-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthDayMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthDay2-form}
      Click Element    ${dateOfBirthDay2-form}
     ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthMonth-form}   timeout=20s
    Run Keyword If    ${element_d1_found}
    ...    Click Element    ${dateOfBirthMonth-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthMonthMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthMonth2-form}
      Click Element    ${dateOfBirthMonth2-form}

           ${element_d2_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthYear-form}   timeout=20s
    Run Keyword If    ${element_d2_found}
    ...    Click Element    ${dateOfBirthYear-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthYearMobile-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
      Sleep   2
      Click Element    ${dateOfPassport-form}
      Wait Until Element Is Visible   ${dateOfPassportDay-form}
      Click Element    ${dateOfPassportDay-form}
      Wait Until Page Contains Element    ${dateOfPassportDay2-form}
      Click Element    ${dateOfPassportDay2-form}
      Wait Until Element Is Visible   ${dateOfPassportMonth-form}
      Click Element    ${dateOfPassportMonth-form}
      Wait Until Page Contains Element     ${dateOfPassportMonth2-form}
      Click Element    ${dateOfPassportMonth2-form}

      Wait Until Element Is Visible   ${dateOfPassportYear-form}
      Click Element    ${dateOfPassportYear-form}
      Click Element    ${dateOfPassportYear2-form}
      Click Element    ${dateOfPassportSubmit_Button}
Enter the information of the foreign passenger
          [Arguments]      ${First name}    ${Last name}    ${PassportId}
      Wait Until Element Is Visible   ${passengerFirstName_Field}    timeout=25
      Input Text       ${passengerFirstName_Field}      ${First name}
      Input Text       ${passengerLastName_Field}      ${Last name}

      Click Element    //span[@class="tw-ms-1 form-country-select_countryName__Rdss_"]
      Wait Until Element Is Visible   css:[placeholder='نام کشور']
      Click Element     css:[placeholder='نام کشور']
      Input Text     css:[placeholder='نام کشور']      انگلستان
      Wait Until Element Is Visible   //div[@class="form-country-select_country__VGBO_ false pointer"]
      Click Element    //div[@class="form-country-select_country__VGBO_ false pointer"]
      Wait Until Element Is Visible   ${passport_Field}

      Input Text       ${passport_Field}      ${PassportId}

      Click Element    ${dateOfBirth-form}
      Wait Until Element Is Visible   ${dateOfBirthDay-form}
      Click Element    ${dateOfBirthDay-form}
      Click Element    ${dateOfBirthDay2-form}
      Wait Until Element Is Visible   ${dateOfBirthMonth-form}
      Click Element    ${dateOfBirthMonth-form}
      Click Element    ${dateOfBirthMonth2-form}
      Wait Until Element Is Visible   ${dateOfBirthYear-form}
      Click Element    ${dateOfBirthYear-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
      Sleep   2
      Click Element    ${dateOfPassport-form}
      Wait Until Element Is Visible   ${dateOfPassportDay-form}
      Click Element    ${dateOfPassportDay-form}
      Wait Until Page Contains Element    ${dateOfPassportDay2-form}
      Click Element    ${dateOfPassportDay2-form}
      Wait Until Element Is Visible   ${dateOfPassportMonth-form}
      Click Element    ${dateOfPassportMonth-form}
      Wait Until Page Contains Element     ${dateOfPassportMonth2-form}
      Click Element    ${dateOfPassportMonth2-form}

      Wait Until Element Is Visible   ${dateOfPassportYear-form}
      Click Element    ${dateOfPassportYear-form}
      Click Element    ${dateOfPassportYear2-form}
      Click Element    ${dateOfPassportSubmit_Button}
Select Normal cancellation
    Execute JavaScript    window.scrollBy(0, 500)
    Sleep    1

    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    xpath://span[.='استرداد بدون جریمه'] 
    Run Keyword If    ${element_found}
   # ...   # Wait Until Element Is Visible   ${Normal cancellation_Button}
    ...    Click Element    ${Normal cancellation_Button}
    ...    ELSE
    ...    Click Element    ${Continue the purchase process_Bottun}
    Sleep  1

Select Return without penalty cancellation
      Wait Until Element Is Visible   ${Return without penalty cancellation_Button}
      Click Element    ${Return without penalty cancellation_Button}
Continue the purchase process
      Wait Until Element Is Visible   ${Continue the purchase process_Bottun}    timeout=20
      Scroll Element Into View        ${Continue the purchase process_Bottun}
      Click Element    ${Continue the purchase process_Bottun}

Select Passengers notebook
      Wait Until Element Is Visible   ${PassengersNotebook_Button}    timeout=40
     Scroll Element Into View        ${PassengersNotebook_Button}
       ${locator}    Set Variable    id=PassengersNotebook_Button
       ${retry_count}=    Set Variable    0
    FOR    ${retry}    IN RANGE    3    # Retry up to 3 times
        ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    ${PassengersNotebook_Button}
        Run Keyword If    ${element_present}    Click Element    ${PassengersNotebook_Button}
        Exit For Loop If    ${element_present}
        ${retry_count}=    Set Variable    ${retry_count + 1}
        Sleep    1s
    END
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${User Passengers' notebook_Button}
    Run Keyword If    ${element_found}
   # ...   # Wait Until Element Is Visible   ${Normal cancellation_Button}
    ...    Click Element    ${User Passengers' notebook_Button}
    ...    ELSE
    ...    Click Element    ${User Passengers' notebookMobile_Button}
    Sleep  1

Click Passengers notebook-Guest User
        Wait Until Element Is Visible   ${PassengersNotebook_Button}    timeout=20
        Scroll Element Into View        ${PassengersNotebook_Button}
      ${locator}    Set Variable    id=PassengersNotebook_Button
       ${retry_count}=    Set Variable    0
     FOR    ${retry}    IN RANGE    3    # Retry up to 3 times
        ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    ${PassengersNotebook_Button}
        Run Keyword If    ${element_present}    Click Element    ${PassengersNotebook_Button}
        Exit For Loop If    ${element_present}
        ${retry_count}=    Set Variable    ${retry_count + 1}
        Sleep    1s
    END

add Adult
      Wait Until Element Is Visible   ${passengerBookAdult_Button}    timeout=20
      Scroll Element Into View        ${passengerBookAdult_Button}
      Click Element    ${passengerBookAdult_Button}
    ${element_d3_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${User Passengers' notebook_Button}   timeout=20s
    Run Keyword If    ${element_d3_found}
    ...    Click Element    ${User Passengers' notebook_Button}
    ...    ELSE
    ...    Click Element     //div[@class='add-passenger_mobileRow__tEv57']
  #    Wait Until Element Is Visible   ${User Passengers' notebook_Button}    timeout=20
   #   Click Element    ${User Passengers' notebook_Button}
add Child
   #   Wait Until Element Is Visible   ${passengerBookChild_Button}   timeout=20
   #   Scroll Element Into View        ${passengerBookChild_Button}
    ${element_d3_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${passengerBookChild_Button}   timeout=20s
    Run Keyword If    ${element_d3_found}
    ...    Click Element    ${passengerBookChild_Button}
    ...    ELSE
    ...    Click Element     ${dateOfBirthYearMobile-form}
    #  Click Element    ${passengerBookChild_Button}
      Wait Until Element Is Visible   ${User Passengers' notebook_Button}    timeout=20
      Click Element    ${User Passengers' notebook_Button}
add Baby
         Wait Until Element Is Visible   ${passengerBookBaby_Button}    timeout=20
      Scroll Element Into View        ${passengerBookBaby_Button}
      Click Element          ${passengerBookBaby_Button}
      Wait Until Element Is Visible   css:.add-passenger_mobileRow__tEv57    timeout=20
      Click Element    css:.add-passenger_mobileRow__tEv57
      Wait Until Element Is Visible   ${User Passengers' notebook_Button}    timeout=20
      Click Element    ${User Passengers' notebook_Button}


Add passenger visa
          [Arguments]      ${First name}    ${Last name}   ${NationalId}  ${Mobile}
      Wait Until Element Is Visible   ${passengerFirstNameVisa_Field}    timeout=25
      Click Element    ${passengerFirstNameVisa_Field}
      Input Text       ${passengerFirstNameVisa_Field}     ${First name}
      Input Text       ${passengerLastNameVisa_Field}      ${Last name}
      Input Text       ${passengerNationalIdVisa_Field}     ${NationalId}
      Input Text       ${MobileVisa_Field}                 ${Mobile}
      Click Element    //span[.='تاریخ تولد']
     ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthDay-form}   timeout=20s
    Run Keyword If    ${element_d_found}
    ...    Click Element    ${dateOfBirthDay-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthDayMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthDay2-form}
      Click Element    ${dateOfBirthDay2-form}
     ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthMonth-form}   timeout=20s
    Run Keyword If    ${element_d1_found}
    ...    Click Element    ${dateOfBirthMonth-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthMonthMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthMonth2-form}
      Click Element    ${dateOfBirthMonth2-form}

           ${element_d2_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthYear-form}   timeout=20s
    Run Keyword If    ${element_d2_found}
    ...    Click Element    ${dateOfBirthYear-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthYearMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
        Sleep   1
      Click Element    //span[.='تاریخ انقضا پاسپورت']
      Wait Until Element Is Visible   ${dateOfPassportDay-form}
      Click Element    ${dateOfPassportDay-form}
      Wait Until Page Contains Element    ${dateOfPassportDay2-form}
      Click Element    ${dateOfPassportDay2-form}
      Wait Until Element Is Visible   ${dateOfPassportMonth-form}
      Click Element    ${dateOfPassportMonth-form}
      Wait Until Page Contains Element     ${dateOfPassportMonth2-form}
      Click Element    ${dateOfPassportMonth2-form}

      Wait Until Element Is Visible   ${dateOfPassportYear-form}
      Click Element    ${dateOfPassportYear-form}
      Click Element    ${dateOfPassportYear2-form}
      Click Element    ${dateOfPassportSubmit_Button}
      Sleep    2
      Click Element    //span[.='تاریخ رفت']
      Sleep    1



        ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthDay-form}   timeout=20s
    Run Keyword If    ${element_d_found}
    ...    Click Element    ${dateOfBirthDay-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthDayMobile-form}
    Wait Until Element Is Visible    css:[tabindex='3']
    Select From List By Label        css:[tabindex='3']            5
     ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthMonth-form}   timeout=20s
    Run Keyword If    ${element_d1_found}
    ...    Click Element    ${dateOfBirthMonth-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthMonthMobile-form}
    #  Wait Until Element Is Visible   id:react-select-3-option-3
     # Click Element   id:react-select-3-option-3
            Sleep    1

         Execute JavaScript    document.querySelector("div.css-1wy0on6 > div:nth-child(2)").click()

           ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthYear-form}   timeout=20s
    Run Keyword If    ${element_d2_found}
    ...    Click Element    ${dateOfBirthYear-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthYearMobile-form}
           Sleep    1

    #    Execute JavaScript    document.querySelector("div.css-1wy0on6 > div:nth-child(2)").click()

    #  Wait Until Element Is Visible  id:react-select-4-option-2
     # Click Element    id:react-select-4-option-2
      Click Element    ${dateOfBirthSubmit_Button}
      Sleep   5

enter information of Cip book
    Execute Javascript    document.querySelector("input.field_value__EXUsj.field_withLabel__j0VNx.text-field_input__e40ih").scrollIntoView()
    Sleep    10
    Click Element    //span[.='نام لاتین']
    Wait Until Element Is Visible    ${cip_name_input}      timeout=10
    Input Text    ${cip_name_input}    REZA
    Input Text    ${cip_family_input}    VFVF
    Input Text    ${cip_nationalId_input}    0020901984
    Sleep    3
    Click Element    //span[.='تاریخ تولد']
     ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthDay-form}   timeout=20s
    Run Keyword If    ${element_d_found}
    ...    Click Element    ${dateOfBirthDay-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthDayMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthDay2-form}
      Click Element    ${dateOfBirthDay2-form}
     ${element_d1_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthMonth-form}   timeout=20s
    Run Keyword If    ${element_d1_found}
    ...    Click Element    ${dateOfBirthMonth-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthMonthMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthMonth2-form}
      Click Element    ${dateOfBirthMonth2-form}

           ${element_d2_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dateOfBirthYear-form}   timeout=20s
    Run Keyword If    ${element_d2_found}
    ...    Click Element    ${dateOfBirthYear-form}
    ...    ELSE
    ...    Click Element     ${dateOfBirthYearMobile-form}
      Wait Until Element Is Visible   ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthYear2-form}
      Click Element    ${dateOfBirthSubmit_Button}
     Click Element     //div[@class='select-field_selectField__H30Vw flex-1 tw-w-full']//div[@class='field_labelValueWrapper__Xvf3_']
     Wait Until Element Is Visible    //div[.='مرد']
      Click Element        //div[.='مرد']




    Execute Javascript    var element = document.evaluate("${airline_box}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; element.scrollIntoView()
    Click Element    ${airline_box}
    Wait Until Element Is Visible       ${first_airline}
    Click Element        ${first_airline}
    Wait Until Element Is Visible    ${Flight number and destination airport}
    Click Element    ${Flight number and destination airport}
    Wait Until Element Is Visible    ${First_Flight_number}
    Click Element    ${First_Flight_number}
    Wait Until Element Is Visible    ${cip_Continue_the_purchase_process}
    Click Element    ${cip_Continue_the_purchase_process}
    Sleep    3

    Execute JavaScript  window.scrollTo(0, document.body.scrollHeight);
    Sleep     2
    Wait Until Element Is Visible   ${confirm and pay}
    Click Element    ${confirm and pay}

    Wait Until Element Is Visible  css:.d-flex.tw-select-none .checkbox-with-logo_icon__ZwD1n  20s
    Execute JavaScript  document.querySelector('.d-flex.tw-select-none .checkbox-with-logo_icon__ZwD1n').classList.remove('hide');
    Click Element    css:.d-flex.tw-select-none .checkbox-with-logo_icon__ZwD1n




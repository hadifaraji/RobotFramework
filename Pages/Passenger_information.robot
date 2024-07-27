*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library        ../pages/python_resource.py
*** Variables *** 

#--------------------------------
${Details and purchase_Button}            css:#general-itineraries-container .itinerary_ticketChooseSection__0StDZ [data-test='show-flight-more-detail-0']
${Buy tickets_Button}                     css:.flight-details_chooseTicketButton__PAFU8
#-------passenger---------
${passengerFirstName_Field}            passengerFirstName
${passengerLastName_Field}             passengerLastName
${nationalId_Field}                    nationalId
${dateOfBirth-form}                    dateOfBirth



${dateOfBirthDayMobile-form}           css:.css-17s22kg-control
${dateOfBirthMonthMobile-form}         css:.css-1xhcotz-control
${dateOfBirthYearMobile-form}          css:.css-xsonp6-control


${dateOfBirthDay-form}                 css:.css-6gq4gv-control .css-1hoxxid
${dateOfBirthDay2-form}                react-select-2-option-1
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
#-------------------------------------------------
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

#--------------------------passenger book page----------------------------
${delete_icon}    //div[@class='dashboard-common_list__6DfYC fw-500']/div[1]//button[@class='icon-trash-fill tw-ms-4 dashboard-common_actionButton__XYa1z dashboard-common_deleteButton__uCvLk button_defaultBtn__E53oA']
${add_passenger_button}  //button[@class='fs-7 button_secondaryBtn__Bygek']
${gender_icon}  //div[@class='popper_popper__uxti2 select-field_popper__7KB0A']/div[.='مرد']
${National_Code_box}  //input[@class='field_value__EXUsj field_withLabel__j0VNx text-field_input__e40ih fs-6 ltr-input']
${Information registration icon}  //button[@class='w-100 button_primaryBtn__dJOjt']
${ Edit_icon}  //div[@class='dashboard-common_list__6DfYC fw-500']/div[1]//button[@class='icon-edittwo-fill tw-ms-4 dashboard-common_actionButton__XYa1z button_defaultBtn__E53oA']




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

######## passenfers book page ########

Entry of minimum passenger information
    Wait Until Element Is Visible    ${add_passenger_button}
    Click Element    ${add_passenger_button}
    Input Text    nameFa    رضا
    Input Text    lastNameFa    نصیری
    Click Element    gender
    Wait Until Element Is Visible    ${gender_icon}
    Click Element    ${gender_icon}
  ${National_Code}  National Code Generator
    Input Text   ${National_Code_box}    ${National_Code}
    Click Element    ${Information registration icon}
    Sleep    5

delete passenger
    Wait Until Element Is Visible    ${delete_icon}
    Click Element    ${delete_icon}
    Wait Until Element Is Visible    css:.tw-me-1
    Click Element    css:.tw-me-1
    Sleep    5


delete all passenfers
    Sleep    3
    ${isVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${delete_icon}    timeout=10s

    WHILE    ${isVisible} == True
        delete passenger
        ${isVisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${delete_icon}    timeout=10s
    END
  
Edit passenger information
    Wait Until Element Is Visible    ${ Edit_icon}
    Click Element    ${ Edit_icon}
    Click Element    nameFa
    Clear Element Text    nameFa
    Press Keys    nameFa    علی

    Click Element    lastNameFa
    Clear Element Text    lastNameFa
    Press Keys    lastNameFa    جعفری
    Click Element    gender
    Wait Until Element Is Visible    ${gender_icon}
    Click Element    ${gender_icon}
    Click Element    ${Information registration icon}
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
${From_Button}              css:.autocomplete_autocomplete__WQES9:nth-child(2) .field_labelValueWrapper__Xvf3_
${FromSelect_Button}        css:*[data-test=\"thr\"]
${To_Button}                css:.autocomplete_autocomplete__WQES9:nth-child(3) .field_labelValueWrapper__Xvf3_
${ToSelect_Button}          css:*[data-test=\"mhd\"]
${Search_Button}            css:.search-button


#--------------------------------
${Details and purchase_Button}            css:#general-itineraries-container .itinerary_ticketChooseSection__0StDZ [data-test='show-flight-more-detail-0']
${Buy tickets_Button}                     css:.flight-details_chooseTicketButton__PAFU8
#-------passenger---------
${passengerFirstName_Field}            passengerFirstName
${passengerLastName_Field}             passengerLastName
${nationalId_Field}                    nationalId
${dateOfBirth-form}                    dateOfBirth

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
#-----------------Terms and Conditions---------

${Terms and Conditions_Link}        css:.checkbox-with-logo_icon__ZwD1n
${Terms and Conditions_Button}      css:.tw-m-auto
#---------------------Bank------------------
${Paying for the ticket_Button}      modals-portal
#----------------------- Select Passengers' notebook----------------------
${Passengers' notebook_Button}       css:.tw-my-0
${User Passengers' notebook_Button}      xpath://button[@class='add-passenger_btn__ltrGt button_secondaryBtn__Bygek']
#-------------------------Purchase description------------------------
${Purchase description_Button}       xpath://button[.='توضیحات']
${Purchase description_TextArea}     xpath://textarea[@class='flex-1 w-100 p-2 text-wrap lh-lg border-radius-card tw-text-[1rem] placeholder:tw-text-[0.875rem] tw-mt-2 border book-stepper_textarea__oQtEt']
#----------------------------travel card--------------

${Travel card_Button}         xpath://button[.='سفرکارت']
${Travel card_TextArea}       xpath://input[@class='field_value__EXUsj field_withLabel__j0VNx text-field_input__e40ih dir-full-ltr tw-text-[1rem]']
#---------------------------discount code-----------------------
${discount code_Button}         xpath://span[.='کد تخفیف']
${discount code_TextArea}       css:[value='RISPJKVORB']


*** Keywords ***
Select End-date
      Wait Until Element Is Visible   ${End-date_Filed}
      Click Element  ${End-date_Filed}
      Wait Until Element Is Visible   ${Select end date}
      Click Element  ${Select end date}
      Wait Until Element Is Visible    ${Confirmed end date}
      Click Element  ${Confirmed end date}      
Change Flight Trip Type RoundTrip
      Wait Until Element Conditions   ${One way_ComboBox} 
      Wait Until Element Is Visible   ${One way_ComboBox}     
      Click Element  ${One way_ComboBox}
      Wait Until Element Is Visible   ${RoundTrip_ComboBox}
      Click Element  ${RoundTrip_ComboBox}

Search Flight Domestic
      Wait Until Element Is Visible   deny    timeout=10
      Click Element            deny
      Wait Until Element Is Visible   ${From_Button}    timeout=10
      Click Element  ${From_Button} 
      Wait Until Element Is Visible   ${FromSelect_Button} 
      Click Element  ${FromSelect_Button}
      Click Element  ${To_Button}
      Wait Until Element Is Visible   ${ToSelect_Button} 
      Click Element  ${ToSelect_Button}
      Click Element  ${Search_Button}
      Click Element   deny
      Sleep  25
Select Tickect
      Wait Until Element Is Visible   ${Details and purchase_Button} 
      Click Element  ${Details and purchase_Button}
      Wait Until Element Is Visible   ${Buy tickets_Button} 
      Click Element  ${Buy tickets_Button} 
Passenger information irani
          [Arguments]      ${First name}    ${Last name}   ${nationalId}
      Wait Until Element Is Visible   ${passengerFirstName_Field} 
      Input Text       ${passengerFirstName_Field}      ${First name} 
      Input Text       ${passengerLastName_Field}      ${Last name}
      Input Text       ${nationalId_Field}      ${nationalId}
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
Select Normal cancellation
      Wait Until Element Is Visible   ${Normal cancellation_Button} 
      Click Element    ${Normal cancellation_Button}
Select Return without penalty cancellation
      Wait Until Element Is Visible   ${Return without penalty cancellation_Button}
      Click Element    ${Return without penalty cancellation_Button}
Continue the purchase process
      Click Element    ${Continue the purchase process_Bottun}
Approval of rules and regulations  
      Scroll Element Into View        ${Terms and Conditions_Link}
      Wait Until Element Is Visible   ${Terms and Conditions_Link} 
     # Sleep  5
      Click Element      ${Terms and Conditions_Link}
     # Click button       ${Terms and Conditions_Button}
confirm and pay
      Click Element    ${Continue the purchase process_Bottun}
      Sleep  5
Paying for the ticket 
    Sleep  5
    Wait Until Element Is Visible   ${Paying for the ticket_Button} 
    Click Element       ${Paying for the ticket_Button}
    Sleep  5
    Wait Until Element Is Visible   ${Paying for the ticket_Button} 
    Click Element       ${Paying for the ticket_Button}
Select Passengers notebook
    Wait Until Element Is Visible   ${Passengers' notebook_Button} 
    Click Element       ${Passengers' notebook_Button}
    Wait Until Element Is Visible   ${User Passengers' notebook_Button} 
    Click Element       ${User Passengers' notebook_Button}
Write a description of the purchase
          [Arguments]      ${Purchase description}    
      Wait Until Element Is Visible   ${Purchase description_Button} 
      Click Element    ${Purchase description_Button}
      Input Text       ${Purchase description_TextArea}      ${Purchase description}
Enter the travel card code
          [Arguments]      ${Travel card code}    
      Wait Until Element Is Visible   ${Travel card_Button} 
      Click Element    ${Travel card_Button}
      Wait Until Element Is Visible   ${Travel card_TextArea} 
      Input Text       ${Travel card_TextArea}       ${Travel card code} 
Click Passengers notebook-Guest User
    Wait Until Element Is Visible   ${Passengers' notebook_Button} 
    Click Element       ${Passengers' notebook_Button}      

Enter the discount code
          [Arguments]      ${discount code}    
      Wait Until Element Is Visible   ${discount code_Button}  
      Click Element    ${discount code_Button} 
      Wait Until Element Is Visible   ${discount code_TextArea} 
      Input Text       ${discount code_TextArea}       ${Travel card code} 

    
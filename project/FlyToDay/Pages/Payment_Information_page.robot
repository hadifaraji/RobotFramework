*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables *** 

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
${Travel cardmin_Button}       css:.payment_discountButton__ZqObP

#---------------------------discount code-----------------------
${discount code_Menu}         xpath://span[.='کد تخفیف']
${discount code_TextArea1}    //div[@class='tw-flex tw-items-center tw-relative']//span[@class='field_label__TwY5y text-field_label__VTSgc']

${discount code_TextArea}      //input[@class='field_value__EXUsj field_withLabel__j0VNx text-field_input__e40ih dir-full-ltr tw-text-[1rem]']
${discount code_Button}       css:.payment_discountButton__ZqObP
#------

${descripsion_Field}            //textarea[@class="field_value__EXUsj field_withLabel__j0VNx text-field_input__e40ih"]

${confirm and pay_Button}       //button[@class="tw-w-full xs:tw-max-w-[300px] tw-h-12 tw-ms-auto button_primaryBtn__dJOjt"]
${Hotel rules and regulations}   //div[@class='fs-7 tw-mr-1 pointer']
#----------------------------Wallet------------------------------------------
${Wallet_Button}                //span[@class='switch-btn_spanCheckBox__NNQ0a']
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
Approval of rules and regulations  
      Scroll Element Into View        ${Terms and Conditions_Link}
      Wait Until Element Is Visible   ${Terms and Conditions_Link} 
     # Sleep  5
      Click Element      ${Terms and Conditions_Link}
     # Click button       ${Terms and Conditions_Button}
confirm and pay
       Sleep  2
       Scroll Element Into View        ${Paying for the ticket_Button}
       Wait Until Keyword Succeeds    10s    1s    Element Should Be Clickable    ${Paying for the ticket_Button}
  #    Wait Until Element Is Visible   ${Paying for the ticket_Button}   timeout=10
       Click Element    ${Continue the purchase process_Bottun}
       Sleep  5
Paying for the ticket 
    Sleep  5
    Wait Until Element Is Visible   ${Paying for the ticket_Button} 
    Click Element       ${Paying for the ticket_Button}
    Sleep  5
    Wait Until Element Is Visible   ${Paying for the ticket_Button} 
    Click Element       ${Paying for the ticket_Button}

Write a description of the purchase
          [Arguments]      ${Purchase description}    
      Wait Until Element Is Visible   ${Purchase description_Button}
      Scroll Element Into View       ${Purchase description_Button}
      Click Element    ${Purchase description_Button}
      Input Text       ${Purchase description_TextArea}      ${Purchase description}
      Sleep     3
Enter the travel card code
          [Arguments]      ${Travel card code}    
      Wait Until Element Is Visible   ${Travel card_Button} 
      Click Element    ${Travel card_Button}
      Wait Until Element Is Visible   ${Travel card_TextArea} 
      Input Text       ${Travel card_TextArea}       ${Travel card code}
      Click Element    ${Travel cardmin_Button}
Enter the discount code
          [Arguments]      ${discount code}    
      Wait Until Element Is Visible   ${discount code_Menu}
      Click Element    ${discount code_Menu}
      Sleep    1
      Wait Until Element Is Visible   ${discount code_TextArea1}
      Click Element    ${discount code_TextArea1}
      Wait Until Element Is Visible   ${discount code_TextArea} 
      Input Text       ${discount code_TextArea}       ${Travel card code} 
      Click Element    ${discount code_Button}
Confirm and pay Hotel
    Sleep  5
    Execute JavaScript    window.scrollBy(0, 1500)
    Sleep  5
    Click Element    //div[@class="tw-flex tw-flex-col tw-gap-3 lg:tw-gap-6 "]
    Scroll Element Into View       ${confirm and pay_Button}
    Wait Until Element Is Visible   ${confirm and pay_Button}
    Click Element                  ${confirm and pay_Button}
Write a description for the hotel reservation
        [Arguments]       ${description}
    Scroll Element Into View       ${descripsion_Field}
    Wait Until Element Is Visible   ${descripsion_Field}
    Input Text    ${descripsion_Field}      ${description}
Confirm the hotel reservation rules and regulations
    Scroll Element Into View       ${confirm and pay_Button}
    Wait Until Element Is Visible   ${confirm and pay_Button}
    Click Element                  ${confirm and pay_Button}
    Wait Until Element Is Visible   ${Hotel rules and regulations}
    Click Element    ${Hotel rules and regulations}
Pay with wallet
    Wait Until Element Is Visible   ${Wallet_Button}
    Click Element                   ${Wallet_Button}

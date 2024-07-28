*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../pages/Login_page.robot
Resource          ../Steps/Flight_Step.robot
Resource          ../Setup/resources.robot
Library    BuiltIn

Suite Setup       Open Login Page Using Chrome Browser mobile
Test Teardown     Close Chrome Browser
*** Variables ***
${Username}      09127988405  
${password1}        123456Aa
${First name}    Ahmad   
${Last name}     Sazgar  
${nationalId}    0440053153
${description}    من یک سرور در قسمت بار دارم حمل میکنم 
${travel card code}    UPZPTN3UNG
${discount code}    RISPJKVORB
${message}         " استفاده از خدمات کد تخفیف یا سفرکارت به صورت همزمان امکان پذیر نیست"
${FromCity}        تهران
${ToCity}          مشهد
${ToCode_City}    MHD
${FromCode_City}    THR
${PassportId}  H12345678
${Country}     انگلستان
*** Test Cases ***

Buying a one-way domestic plane ticket Mobile  #PASS
     Given Login User   ${Username}  ${password1}   
     When Search domestic flight tickets     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation Mobile       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay
Successful purchase of a one-way ticket for a foreign adult Mobile   #PASS
     Given Login User   ${Username}  ${password1}
     When Domestic flight search Mobile    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter the information of the foreign passenger and select normal cancellation Mobile     ${First name}    ${Last name}    ${PassportId}   ${Country}
     Then Approval of rules And pay

Buying a RoundTrip domestic plane ticket Mobile   #PASS
     Given Login User   ${Username}  ${password1}   
     When Select Flight Domestic RoundTrip Mobile              ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation Mobile      ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay
Buying domestic tickets with refund without penalty Mobile     #PASS
     Given Login User   ${Username}  ${password1}   
     When Domestic flight search Mobile   ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation Mobile    ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay
Buying domestic tickets with Select Passengers'notebook And write Discirpsion Mobile  #PASS
     Given Login User   ${Username}  ${password1}
     When Domestic flight search Mobile    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter description of the purchase  ${description}
Buying Geust User a one-way domestic plane ticket Mobile   #PASS
     Given Domestic flight search Mobile     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation Mobile -Guest User          ${First name}    ${Last name}   ${nationalId}
     When Login User Guest  ${Username}  ${password1}
     Then Approval of rules And pay And Enter description of the purchase  ${description}
Buying a one-way domestic plane ticket with Select Passengers'notebook And travel card Mobile   #PASS
     Given Login User   ${Username}  ${password1}
     When Domestic flight search Mobile     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And travel card code      ${travel card code}
Buying a one-way domestic plane ticket with Select Passengers'notebook And discount code Mobile   #PASS
     Given Login User   ${Username}  ${password1}
     When Domestic flight search Mobile    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay And Enter the discount code     ${discount code}
Buying domestic tickets with Passengers'notebook Guest user Mobile    #PASS
     Given Domestic flight search Mobile    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Click Passengers notebook
     When Login User Guest  ${Username}  ${password1}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay
Buying a one-way domestic plane ticket-Checking the discount code and gift card at the same time Mobile   #PASS
      Given Login User   ${Username}  ${password1}
      When Domestic flight search Mobile     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      When Select Passengers notebook of Iranian And Select Normal cancellation
      Then Approval of rules And pay And Enter the discount code & travel card code     ${discount code}    ${travel card code}    ${message}
Successful purchase of a one-way domestic flight ticket for an adult and a child
      Given Login User   ${Username}  ${password1}
      When Domestic flight search for an adult and a child        ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      When Adding the information of an adult and a child to the passenger information section
      Then Approval of rules And pay
Successful purchase of a one-way domestic flight ticket for an adult and a Baby
      Given Login User   ${Username}  ${password1}
      When Domestic flight search for an adult and a Baby       ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      When Adding the information of an adult and a Baby to the passenger information section
      Then Approval of rules And pay


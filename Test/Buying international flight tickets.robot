*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../pages/Login_page.robot
Resource          ../Steps/Flight_Step.robot
Resource          ../Setup/resources.robot

Suite Setup       Open Login Page Using Chrome Browser app
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
${PassportId}   J97634522
${message}
*** Test Cases ***

Buying a one-way international plane ticket
     [Tags]     one-way
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Enter information of Iranian passengers with passport And Select Normal cancellation      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
     Then Approval of rules And pay
Buying a RoundTrip Internaitional plane ticket
        [Tags]     round-trip
     Given Login User   ${Username}  ${password1}
     When Select part international flight
     When Select Flight Internaitional RoundTrip
     When Enter information of Iranian passengers with passport And Select Normal cancellation      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
     Then Approval of rules And pay
Buying Internaitional tickets with refund without penalty    #PASS
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Enter information of Iranian passengers with passport And Select Normal cancellation      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
     Then Approval of rules And pay
Buying Internaitional tickets with Select Passengers'notebook And write Discirpsion   #PASS
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter description of the purchase  ${description}

Buying Geust User a one-way Internaitional plane ticket     #PASS
     Given Select part international flight
     When Select Flight Internaitional
     When Click Passengers notebook
     When Login User Guest  ${Username}  ${password1}
      When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter description of the purchase  ${description}

Buying a one-way Internaitional plane ticket with Select Passengers'notebook And travel card     #PASS
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And travel card code      ${travel card code}

Buying a one-way Internaitional plane ticket with Select Passengers'notebook And discount code  #PASS
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter the discount code     ${discount code}

Buying Internaitional tickets with Passengers'notebook Guest user  #PASS
     Given Select part international flight
     Given Select Flight Internaitional
     When Click Passengers notebook
     When Login User Guest  ${Username}  ${password1}
    When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay
Buying a one-way Internaitional plane ticket-Checking the discount code and gift card at the same time
      Given Login User   ${Username}  ${password1}
      Given Select part international flight
      When Select Flight Internaitional
      When Click Passengers notebook
      When Select Passengers notebook of Iranian And Select Normal cancellation
      Then Approval of rules And pay And Enter the discount code & travel card code     ${discount code}    ${travel card code}     ${message}



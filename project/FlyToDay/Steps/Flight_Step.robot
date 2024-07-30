*** Settings ***

Resource          ../pages/Home_page.robot
Resource          ../pages/Passenger_information.robot
Resource          ../pages/Payment_Information_page.robot
Resource          ../pages/SearchFlight_page.robot
Resource          ../pages/Orderprocessreport_page.robot

*** Keywords ***
Handle Stale Element
    [Arguments]    ${locator}
    ${retry_count}=    Get Variable    ${retry_count}
    ${retry_count}=    Set Variable If    ${retry_count} is open
#............................mobile------------------------------
Domestic flight search Mobile
     [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Click Flight mobile
      Search domestic flight      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Finalize the search
      Select Tickect
Select Flight Domestic RoundTrip Mobile
      [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Click Flight mobile
      Change Flight Trip Type RoundTrip
      Select End-date
      Search domestic flight      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Finalize the search
      Select Tickect Mobile

 #........................................................................................
Select part international flight
    Click international Flight Tab
Select part international flight Mobile
    Select Type Flight International

Select Flight Internaitional
      Search Flight Internaitional
      Finalize the search
      Select Tickect
International flight search for an adult and a child
      Search Flight Internaitional
      Add a child passenger list
      Finalize the search
      Select Tickect
Domestic flight search for an adult and a child
     [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Search domestic flight      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Add a child passenger list
      Finalize the search
      Select Tickect

Domestic flight search for an adult and a Baby
      [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Search domestic flight      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Add a Baby passenger list
      Finalize the search
      Select Tickect
Search domestic flight tickets
      [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Search domestic flight     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Finalize the search
      Select Tickect
Select Flight Internaitional RoundTrip
      Change Flight Trip Type RoundTrip
      Select End-date
      Search Flight Internaitional
      Finalize the search
      Select Tickect
Select Flight International MultiWay
      Change Flight Trip Type MultiWay
      Search Flight Internaitional MultiWay
      Select End-date For MultiWay Flight
      Finalize the search
      Select Multiway Ticket
Search domestic flight ticketsRoundTrip
      [Arguments]      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Change Flight Trip Type RoundTrip
      Select End-date
      Search domestic flight      ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      Finalize the search
      Select Tickect
Add a child to the passenger list
      Add a child passenger list
#-----------------------------Mobile--------------------------------------------------
Enter information of Iranian passengers And Select Normal cancellation Mobile
      [Arguments]           ${First name}    ${Last name}   ${nationalId}
      information of Iranian passengers Mobile   ${First name}    ${Last name}   ${nationalId}
      Select Normal cancellation
      Continue the purchase process
Enter the information of the foreign passenger and select normal cancellation Mobile
      [Arguments]           ${First name}    ${Last name}    ${PassportId}   ${Country}
  #    Continue the purchase process
      Enter the information of the foreign passenger Mobile       ${First name}    ${Last name}    ${PassportId}  ${Country}
      Select Normal cancellation
      Continue the purchase process
Enter information of Iranian passengers And Select Normal cancellation Mobile -Guest User
      [Arguments]           ${First name}    ${Last name}   ${nationalId}
      information of Iranian passengers Mobile   ${First name}    ${Last name}   ${nationalId}
      Select Normal cancellation
      Continue the purchase process

#-----------------------------Passenger info--------------------------------------------------

Adding the information of an adult and a Baby to the passenger information section
     add Adult
     add Baby
     Select Normal cancellation
     Continue the purchase process
Adding the information of an adult and a child to the passenger information section
     add Adult
     add Child
     Select Normal cancellation
     Continue the purchase process


Enter information of Iranian passengers with passport And Select Normal cancellation    #
          [Arguments]           ${First name}    ${Last name}   ${nationalId}  ${PassportId}
          ${text_found}    Run Keyword And Return Status    Element Should Be Visible      //span[@class='ps-3 fs-6 fw-600']     timeout:20s
    Run Keyword If    ${text_found}
    ...       Continue the purchase process
      Information Of Iranian Passengers With Passport      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
      Select Normal cancellation
      Continue the purchase process
Enter information of Iranian passengers And Select Normal cancellation
      [Arguments]           ${First name}    ${Last name}   ${nationalId}
      #Continue the purchase process
      Information Of Iranian Passengers      ${First name}    ${Last name}   ${nationalId}
      Select Normal cancellation
      Continue the purchase process
Enter the information of the foreign passenger and select normal cancellation
      [Arguments]           ${First name}    ${Last name}    ${PassportId}
      Continue the purchase process
      Enter the information of the foreign passenger       ${First name}    ${Last name}    ${PassportId}
      Select Normal cancellation
      Continue the purchase process
Enter information of Iranian passengers And Return without penalty cancellation
      [Arguments]           ${First name}    ${Last name}   ${nationalId}      ${PassportId}
      Continue the purchase process
      Information Of Iranian Passengers With Passport      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
      Select Return without penalty cancellation
      Continue the purchase process


Select Passengers notebook of Iranian And Select Normal cancellation
     # Continue the purchase process
    ${text_found}    Run Keyword And Return Status    Element Should Be Visible      //span[@class='ps-3 fs-6 fw-600']     timeout:20s
    Run Keyword If    ${text_found}
    ...       Continue the purchase process
      Select Passengers notebook    
      Select Normal cancellation
      Continue the purchase process
Click Passengers notebook
      Click Passengers notebook-Guest User      
#....................................
Approval of rules And pay With Wallet
      confirm and pay
      Pay With Wallet
      Approval of rules and regulations
      confirm and pay

Approval of rules And pay
      confirm and pay
      Approval of rules and regulations
      confirm and pay
Approval of rules And pay And Enter description of the purchase
       [Arguments]           ${description} 
      confirm and pay
      Approval of rules and regulations
      Write a description of the purchase    ${description} 
      confirm and pay
Approval of rules And pay And travel card code
       [Arguments]           ${travel card code} 
      confirm and pay
      Approval of rules and regulations
      Enter the travel card code    ${travel card code} 
      confirm and pay
Approval of rules And pay And Enter the discount code
       [Arguments]           ${discount code} 
      confirm and pay
      Approval of rules and regulations
      Enter the discount code    ${discount code} 
      confirm and pay
      
Approval of rules And pay And Enter the discount code & travel card code
       [Arguments]           ${discount code}      ${travel card code}   ${message}
      confirm and pay
      Approval of rules and regulations
      Enter the discount code    ${discount code}
      Enter the travel card code    ${travel card code} 
      Should Be True    ${message}

Receive the purchased ticket
     # [Arguments]    ${initial_status}
    #   Checking the status of ticket issuance
   #    Check Status Change      ${initial_status}
       Check Status Change
Return the purchased ticket

        Check Status Change1

*** Settings ***
Resource          ../pages/Hotel_page.robot
Resource          ../pages/Passenger_information.robot
Resource          ../pages/Payment_Information_page.robot
*** Keywords ***

Search for a hotel in the country
     Domestic hotel search
     Select First Hotel
     Reservation inquiry

Confirmation and final payment of hotel reservation
      [Arguments]        ${description}
      Write a description for the hotel reservation      ${description}
      Confirm the hotel reservation rules and regulations
      Confirm and pay Hotel
Select International hotel Part
    Select International Part
    Sleep  5
Search for a International hotel in the country
     [Arguments]      ${City}
     International hotel search      ${City}
     Select First Hotel
     Reservation inquiry

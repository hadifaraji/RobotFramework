*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../pages/Login_page.robot
Resource          ../Steps/Flight_Step.robot
Resource          ../Setup/resources.robot

Test Setup        Open Login Page Using Chrome Browser app
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
     [Documentation]     خرید موفق پرواز یکطرفه خارجی یک بزرگسال
     [Tags]     one-way
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Enter information of Iranian passengers with passport And Select Normal cancellation      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
     Then Approval of rules And pay
Buying a RoundTrip Internaitional plane ticket
     [Documentation]     خرید موفق پرواز دوطرفه خارجی یک بزرگسال
     [Tags]     round-trip
     Given Login User   ${Username}  ${password1}
     When Select part international flight
     When Select Flight Internaitional RoundTrip
     When Enter information of Iranian passengers with passport And Select Normal cancellation      ${First name}    ${Last name}   ${nationalId}  ${PassportId}
     Then Approval of rules And pay
Buying A Multi Route Flight Ticket
     [Documentation]            خرید موفق بلیط پرواز چند مسیره با انتخاب از دفترچه مسافران
     [Tags]     Multi-way
     Given Login User   ${Username}  ${password1}
     When Select part international flight
     When Select Flight International MultiWay
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay
Buying Internaitional tickets with refund without penalty    #PASS
            [Documentation]    خرید موفق پرواز یکطرفه خارجی یک بزرگسال با استرداد بدون جریمه
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Enter information of Iranian passengers And Return without penalty cancellation         ${First name}    ${Last name}   ${nationalId}   ${PassportId}
     Then Approval of rules And pay
Buying Internaitional tickets with Select Passengers'notebook And write Discirpsion   #PASS
     [Documentation]    خرید موفق پرواز یکطرفه خارجی یک بزرگسال با استفاده از دفترچه مسافران و اضافه کردن توضیحات
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter description of the purchase  ${description}

Buying Geust User a one-way Internaitional plane ticket with Select Passengers'notebook And write Discirpsion
     [Documentation]    خرید موفق کاربر میهمان پرواز یکطرفه خارجی یک بزرگسال با استفاده از دفترچه مسافران و اضافه کردن توضیحات
     Given Select part international flight
     When Select Flight Internaitional
     When Click Passengers notebook
     When Login User Guest  ${Username}  ${password1}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter description of the purchase  ${description}

Buying a one-way Internaitional plane ticket with Select Passengers'notebook And travel card     #PASS
     [Documentation]    خرید موفق پرواز یکطرفه خارجی یک بزرگسال با استفاده از دفترچه مسافران و کارت هدیه
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And travel card code      ${travel card code}
Buying a one-way Internaitional plane ticket with Select Passengers'notebook And discount code  #PASS
     [Documentation]    خرید موفق پرواز یکطرفه خارجی یک بزرگسال با استفاده از دفترچه مسافران و کد تخفیف
     Given Login User   ${Username}  ${password1}
     Given Select part international flight
     When Select Flight Internaitional
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter the discount code     ${discount code}
Buying Internaitional tickets with Passengers'notebook Guest user  #PASS
    [Documentation]    خرید موفق کاربر میهمان پرواز یکطرفه خارجی یک بزرگسال با استفاده از دفترچه مسافران
     Given Select part international flight
     Given Select Flight Internaitional
     When Click Passengers notebook
     When Login User Guest  ${Username}  ${password1}
    When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay
Buying a one-way Internaitional plane ticket-Checking the discount code and gift card at the same time
     [Documentation]    خرید موفق پرواز یکطرفه خارجی یک بزرگسال با استفاده از دفترچه مسافران و بررسی استفاده همزمان کد تخفیف و کارت هدیه
      Given Login User   ${Username}  ${password1}
      Given Select part international flight
      When Select Flight Internaitional
      When Click Passengers notebook
      When Select Passengers notebook of Iranian And Select Normal cancellation
      Then Approval of rules And pay And Enter the discount code & travel card code     ${discount code}    ${travel card code}     ${message}



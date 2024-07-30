*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library    Telnet
Resource          ../Steps/Login_Step.robot
Resource          ../Steps/Order list_Step.robot
Resource          ../Steps/Flight_Step.robot
Resource          ../Setup/resources.robot
Resource          ../Steps/Home_Step.robot

Library    BuiltIn
Library    Collections

Test Setup        Open Login Page Using Chrome Browser Satge
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
${initial_status}    صادر شده
${NumberOrder}    1007460
*** Test Cases ***
Buying a one-way domestic plane ticket     #PASS
    [Documentation]     خرید موفق پرواز یکطرفه داخلی یک بزرگسال
     Given Login User   ${Username}  ${password1}   
     When Search domestic flight tickets     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay
Successful purchase of a one-way ticket for a foreign adult    #PASS
     [Documentation]     خرید موفق پرواز یکطرفه داخلی یک بزرگسال خارجی
     Given Login User   ${Username}  ${password1}
     When Search domestic flight tickets    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter the information of the foreign passenger and select normal cancellation      ${First name}    ${Last name}    ${PassportId}
     Then Approval of rules And pay
Buying a RoundTrip domestic plane ticket    #PASS
        [Documentation]     خرید موفق پرواز دوطرفه داخلی یک بزرگسال
     Given Login User   ${Username}  ${password1}   
     When Search domestic flight ticketsRoundTrip              ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay
Buying domestic tickets with refund without penalty     #PASS0
    [Documentation]      خرید موفق پرواز یکطرفه داخلی یک بزرگسال خارجی با استرداد بدون جریمه
     Given Login User   ${Username}  ${password1}   
     When Search domestic flight tickets  ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay
Buying domestic tickets with Select Passengers'notebook And write Discirpsion   #PASS0
     [Documentation]      خرید موفق پرواز یکطرفه داخلی یک بزرگسال با استفاده از دفترچه مسافرین و توضیحات
     Given Login User   ${Username}  ${password1}
     When Search domestic flight tickets    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And Enter description of the purchase  ${description}
Buying Geust User a one-way domestic plane ticket   #PASS0
     [Documentation]      خرید موفق کاربر میهمان پرواز یکطرفه داخلی یک ی بزرگسال
     Given Search domestic flight tickets    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     When Login User Guest  ${Username}  ${password1}
     Then Approval of rules And pay And Enter description of the purchase  ${description}
Buying a one-way domestic plane ticket with Select Passengers'notebook And travel card
     [Documentation]    خرید موفق کاربر میهمان پرواز یکطرفه داخلی یک ی بزرگسال با استفاده از دفترچه تلفن و کارت هدیه
     Given Login User   ${Username}  ${password1}
     When Search domestic flight tickets    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay And travel card code      ${travel card code}
Buying a one-way domestic plane ticket with Select Passengers'notebook And discount code    #Pass0
         [Documentation]    خرید موفق پرواز یکطرفه داخلی یک ی بزرگسال با استفاده از دفترچه تلفن و کد تخفیف
     Given Login User   ${Username}  ${password1}
     When Search domestic flight tickets   ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay And Enter the discount code     ${discount code}
Buying domestic tickets with Passengers'notebook Guest user
      [Documentation]    خرید موفق کاربر میهمان پرواز یکطرفه داخلی یک ی بزرگسال با استفاده از دفترچه تلفن
     Given Search domestic flight tickets   ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Click Passengers notebook
     When Login User Guest  ${Username}  ${password1}
     When Select Passengers notebook of Iranian And Select Normal cancellation
     Then Approval of rules And pay
Buying a one-way domestic plane ticket-Checking the discount code and gift card at the same time
      [Documentation]    خرید موفق پرواز یکطرفه داخلی یک بزرگسال با استفاده از دفترچه مسافران و بررسی استفاده همزمان کد تخفیف و کارت هدیه
      Given Login User   ${Username}  ${password1}
      When Search domestic flight tickets    ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      When Select Passengers notebook of Iranian And Select Normal cancellation
      Then Approval of rules And pay And Enter the discount code & travel card code     ${discount code}    ${travel card code}    ${message}
Successful purchase of a one-way domestic flight ticket for an adult and a child
         [Documentation]    خرید موفق پرواز یکطرفه داخلی یک بزرگسال و یک بچه با استفاده از دفترچه مسافران
      Given Login User   ${Username}  ${password1}
      When Domestic flight search for an adult and a child        ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      When Adding the information of an adult and a child to the passenger information section
      Then Approval of rules And pay
Successful purchase of a one-way domestic flight ticket for an adult and a Baby
      [Documentation]    خرید موفق پرواز یکطرفه داخلی یک بزرگسال و یک کودک با استفاده از دفترچه مسافران
      Given Login User   ${Username}  ${password1}
      When Domestic flight search for an adult and a Baby       ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
      When Adding the information of an adult and a Baby to the passenger information section
      Then Approval of rules And pay
Buying a one-way domestic plane ticket with wallet
    [Documentation]     خرید موفق پرواز یکطرفه داخلی یک بزرگسال با کیف پول
     Given Login User   ${Username}  ${password1}
     When Search domestic flight tickets     ${FromCity}  ${FromCode_City}  ${ToCity}   ${ToCode_City}
     When Enter information of Iranian passengers And Select Normal cancellation       ${First name}    ${Last name}   ${nationalId}
     Then Approval of rules And pay With Wallet
     Then Return the purchased ticket

Returning the purchased plane ticket successfully plane ticket from the orders menu
    [Documentation]     خرید موفق پرواز و استرداد از منوی سفارشات
     Given Login User   ${Username}  ${password1}
     Given Go to order list
     When Search for the order number in the list of orders        ${NumberOrder}
     Then Return the purchased ticket

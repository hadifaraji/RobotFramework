*** Settings ***
Documentation  this is my first testcase
Library  SeleniumLibrary

*** Keywords ***
open browser Chrome
   open browser     https://www.flytoday.ir/    Chrome
   # باز کردن کروم
   Maximize Browser Window
   Sleep   7
Login mobile
    [Arguments]        ${Username}
    #SapGuiLibrary.Input Text 	 element_id 	 text
    # مقدار ورودی نام کاربری مثلا 09127988405
      Wait Until Element Is Visible   ${Login_Button}
      Click Element  ${Login_Button} 
      Wait Until Element Is Visible   ${username_Filed}
      Input Text     ${username_Filed}          ${Username}
      Sleep   1
      Click Element  //button[contains(text(),'ادامه')] 
   # Input Text 	  ${username_Filed}	     ${Username}
    # یوزر نیم فیلد را پیدا میکند
     # مقدار یوزر نیم را در فیلد یوزر نیم وارد میکند
*** Variables ***
${Login_Button}     //*[@id="back-to-top-anchor"]/header/div/div[2]/button/div[2]/span[1]
${username_Filed}     emailOrMobile
 # مقدار یورز نیم فیلد یا ادرسش روی صفحه 
${Username}            09127988405

# مقداری که در فیلد یوزر نیم میخوایم سرچ کنیم 
*** Test Cases ***
Login mobile user
     Given open browser Chrome
     Given Login mobile       ${Username} 
     # مقدار لاگین یوزر را از کی برد فراخوانی میکنی
     # مقدار یوزر نیم را  وریبل فراخوانی میکنید 
     Sleep      5 
    # پنج ثانیه سیستم خاموش می شود .
    Close All Browsers
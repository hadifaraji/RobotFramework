*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${UrlDevTrain}      https://dev07.flytoday.ir/
${UrlApp1}           https://stage.flytoday.ir/
${UrlApp}           https://production.flytoday.ir/
${BROWSER}           Chrome

#${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

*** Keywords ***
Open Login Page Using Chrome Browser Dev Train
  Open Browser     ${UrlDevTrain}    Chrome     
  Maximize Browser Window
Open Login Page Using Chrome Browser mobile
 #   Open Browser  ${UrlApp}    ${BROWSER}
   ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-cache
    Open Browser    https://production.flytoday.ir/    chrome    options=${chrome_options}
  #  ...   options=add_argument("--disable-notifications")
  #  Maximize Browser Window
    Set Window Size         720        1280



Open Login Page Using Chrome Browser app
    Open Browser  ${UrlApp}    ${BROWSER}
    ...   options=add_argument("--disable-notifications")
    Maximize Browser Window

     #Call Method    ${chrome_options}    add_argument    --disable-notifications
    # Create WebDriver    Chrome    chrome_options=${chrome_options}
   # Open Browser     ${UrlApp}    Chrome   
    #Maximize Browser Window
    #...   options=add_argument("--disable-notifications")
    # Execute JavaScript    window.navigator.permissions.revoke({name:'notifications'}).then(result => result.state === 'granted' ? result.state : Notification.requestPermission()).then(permission => permission === 'denied' ? 'Permission granted' : 'Permission denied')
    #Execute JavaScript    window.navigator.permissions.query({name:'notifications'}).then(result => result.state === 'denied' ? result.state : Notification.requestPermission()).then(permission => permission === 'granted' ? 'Permission granted' : 'Permission denied')

Close Chrome Browser  
    Close All Browsers
        #   Close Browser
 #   Run Keyword If Test Failed    Capture Page Screenshot
  #   Close Window   
  
     Sleep     1
*** Settings ***
Library    SeleniumLibrary
*** Variables ***
@{BROWSERS}          firefox  chrome  IE
#${CHROME_OPTIONS}    ${EMPTY}    args=--disable-cache

@{Sizes}
...    720x1280
...    360x640
...    1080x1920
${CHROME_OPTIONS}    {'args': ['--disable-notifications', '--disable-cache']}
*** Test Cases ***
Clear Browser Cache
     Open Browser    https://production.flytoday.ir/    chrome    options=${CHROME_OPTIONS}

Block Chrome Notifications
  [Documentation]    Execute the test case across multiple browsers
  FOR    ${browser}    IN    @{BROWSERS}
    FOR    ${size}    IN    @{SIZES}

       Open Browser  https://production.flytoday.ir/    ${browser}
    #   ...   options=add_argument("--disable-notifications")
         Set Window Size    ${size.split('x')[0]}    ${size.split('x')[1]}
         Sleep    1
    END
  END

tesexxz zxzxzx
   ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-cache
    Open Browser    https://production.flytoday.ir/    chrome    options=${chrome_options}
    #    Open Browser  https://production.flytoday.ir/    chrome
    #...   options=add_argument("--disable-notifications")
   # ...   options=add_argument("--disable-cache")
    #Set Window Size     ${size[0]}     ${size[1]}

  #  ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
 #   Call Method    ${options}    add_argument    ${CHROME_OPTIONS}
  #  Open Browser    https://www.example.com    Chrome    options=${options}
        Sleep    5
      Click Element    //button[@class="nav_navButtonLeftSecond__PeZHr "]
    Wait Until Element Is Visible   //input[@name="emailOrMobile"]

    Input Text    //input[@name="emailOrMobile"]    09127988405
    Click Element    //button[@class="authentication_btnAuth__WVPok button_primaryBtn__dJOjt"]
    Click Element    css:.authentication_btnAuth__WVPok
    Wait Until Element Is Visible   //input[@name="pass"]
    Input Text    //input[@name="pass"]    123456Aa
    Click Element    //button[@class="authentication_btnAuth__WVPok button_primaryBtn__dJOjt"]
    Sleep     5
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //h2[.='درخواست ویزای توریستی']
    Run Keyword If    ${element_found}
    ...    Click Element    //h2[.='درخواست ویزای توریستی']
    ...    ELSE
    ...    Click Element    //h2[.='گزارش سالانه فلای‌تودی 1402']
        Sleep     10
#   END
    Close Browser
Example Test
    @{sizes}    Create List    1200x800    1600x900    1024x768
    FOR    ${size}    IN    @{sizes}
        ${width}    ${height}=    Split String    ${size}    x
        ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method    ${chrome_options}    add_argument    --window-size=${width},${height}
        Open Browser    https://www.example.com    Chrome    options=${chrome_options}
        # Perform other actions here
        Close Browser
    END
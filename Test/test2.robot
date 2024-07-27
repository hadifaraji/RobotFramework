*** Settings ***
Library           Collections
Library    SeleniumLibrary

*** Variables ***
@{elements}       css:.icon-flight    second    third    fourth
${first_element}  //span[.='مبدا']



*** Test Cases ***
Example Test Case
       ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --disable-cache
    Open Browser    https://production.flytoday.ir/    chrome    options=${chrome_options}
    Set Window Size         720        1280

    ${element_d_found}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://span[.='پرواز']    timeout=5s
    Run Keyword If    ${element_d_found}
    ...    Click Element    xpath://span[.='پرواز']
    ...    ELSE
    ...    Click Element    //span[.='مبدا']
    Sleep      10
    # Close the browser at the end of the test
    Close Browser
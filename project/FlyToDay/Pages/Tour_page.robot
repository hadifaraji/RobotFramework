*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
*** Variables ***
${Username}      09127988405
${password1}        123456Aa
${URL}  https://stage.flytoday.ir/
${BROWSER}  chrome
${dubay_path}  //a[@href='/packagetour/united-arab-emirates/dubai']/div[@class='p-3 d-flex flex-1 flex-column gap-12px bg-white tour-itinerary_content__HsPoo']
${dubay_path_2}  //a[@href='/packagetour/united-arab-emirates/dubai/PT280524001']//div[@class='tw-flex tw-items-center tw-gap-3']
${stanbul_path}  css:[alt='تور استانبول']
${stanbul_path2}  css:.tw-text-primaryBlack
${TOUR_DATE_SPAN}  //span[.='انتخاب تاریخ تور']
${TOUR_DATE_OPTION}  (//div[@class='option_selectOption__T1yUy'])[1]
${name_field}  name=fullName
*** Keywords ***
Enter Passnger info
    Wait Until Element Is Visible    ${TOUR_DATE_SPAN}    timeout=10
    Scroll Element Into View    ${TOUR_DATE_SPAN}
    Click Element    ${TOUR_DATE_SPAN}
    Wait Until Element Is Visible    ${TOUR_DATE_OPTION}
    Scroll Element Into View    ${TOUR_DATE_OPTION}
    Click Element    ${TOUR_DATE_OPTION}
    Sleep    2
    Wait Until Element Is Visible    ${name_field}
    Input Text    //input[@name='fullName']    تستی
    Wait Until Element Is Visible    css:.pe-lg-3
    Click Element    css:.pe-lg-3

Finalization of the tour inquiry by the agency
    Scroll Element Into View    //button[@class="tw-mt-0 button_primaryBtn__dJOjt"]
    Click Element    //button[@class="tw-mt-0 button_primaryBtn__dJOjt"]
    # Scroll Element Into View    //button[@class="w-100 fs-7 button_primaryBtn__dJOjt"]
    Wait Until Element Is Visible    //button[@class="w-100 fs-7 button_primaryBtn__dJOjt"]
    Click Element    //button[@class="w-100 fs-7 button_primaryBtn__dJOjt"]
    Sleep    2
    Close Browser
      

Select Dubai Tour
    [Arguments]       ${Tour}
    Sleep    4
    Scroll Element Into View    //strong[.='${Tour}']
    Wait Until Element Is Visible    //strong[.='${Tour}']
    Click Element       //strong[.='${Tour}']

    Sleep    4
    Scroll Element Into View    ${dubay_path_2}
    Wait Until Element Is Visible    ${dubay_path_2}
    Click Element    ${dubay_path_2}
Select stanbul tour
    Sleep    4
    Wait Until Element Is Visible    ${stanbul_path}
    Click Element    ${stanbul_path}    
    Sleep    4
    Scroll Element Into View    ${stanbul_path2}
    Wait Until Element Is Visible    ${stanbul_path2}
    Click Element    ${stanbul_path2} 

select tour
    Wait Until Element Is Visible    css:.icon-chevron-down
    Click Element    css:.icon-chevron-down
    Wait Until Element Is Visible    //div[.='تور']
    Click Element    //div[.='تور']
    Sleep    2
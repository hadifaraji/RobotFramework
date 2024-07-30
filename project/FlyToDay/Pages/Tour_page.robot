*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library        ../pages/python_resource.py
*** Variables ***
${Username}      09127988405
${password1}        123456Aa
${URL}  https://stage.flytoday.ir/
${BROWSER}  chrome
${more_icon}  //span[.='بیشتر']
${tour_icon}  //div[.='تور']
${tour_icon_mobile}  //span[.='تور']
${full_name_input}  //input[@name='fullName']
${first_tour}   (//div[@class='col-12 px-12 col-md-6 col-lg-4 justify-content-center position-relative tour-itinerary_cardContainer__30Jek'])[1]
${TOUR_DATE_SPAN}  //span[.='انتخاب تاریخ تور']
${TOUR_DATE_OPTION}  (//div[@class='option_selectOption__T1yUy'])[1]
${name_field}  name=fullName
${registration icon}  //button[@class="tw-mt-0 button_primaryBtn__dJOjt"]
${I_realized_bytoon}  //button[@class="w-100 fs-7 button_primaryBtn__dJOjt"]
*** Keywords ***


select tour
    [Arguments]   ${Tour_name}
    ${more_icon_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${more_icon}    timeout=5s
    Run Keyword If    ${more_icon_found}    Click Element    ${more_icon}
    Run Keyword Unless    ${more_icon_found}    Click Element    ${tour_icon_mobile} 
    Sleep    2
    ${tour_icon_found}    Run Keyword And Return Status    Wait Until Element Is Visible    ${tour_icon}    timeout=5s
    Run Keyword If    ${tour_icon_found}    Click Element    ${tour_icon}
    Sleep    2
    Wait Until Element Is Visible    ${Tour_name}
    Scroll Element Into View    ${Tour_name}
    Click Element    ${Tour_name}    
    Sleep    2
    Scroll Element Into View    ${first_tour}
    Wait Until Element Is Visible    ${first_tour}
    Click Element    ${first_tour} 
    Sleep    2





Enter Passnger info
    Scroll Element Into View    ${registration icon}
    Execute JavaScript    window.scrollBy(0, 100);  # Scroll 100 pixels down from the current position
    Wait Until Element Is Visible    ${TOUR_DATE_SPAN}    timeout=10
    Click Element    ${TOUR_DATE_SPAN}
    Wait Until Element Is Visible    ${TOUR_DATE_OPTION}
    Scroll Element Into View    ${TOUR_DATE_OPTION}
    Click Element    ${TOUR_DATE_OPTION}
    Sleep    2
    Wait Until Element Is Visible    ${name_field}
    Input Text    ${full_name_input}    تستی
Finalization of the tour inquiry by the agency
    Click Element    ${registration icon}
    Wait Until Element Is Visible    ${I_realized_bytoon}
    Click Element    ${I_realized_bytoon}
      



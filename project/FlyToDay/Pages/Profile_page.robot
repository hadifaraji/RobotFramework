*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables *** 
${IconProfile_Btn}    css:.icon-profile-fill
${profile_Menu}       css:[data-test='profile']
${My passengers_Button}       //span[.='مسافران من']

${Password_Field}    pass
${Submit_Button}     css:[data-test='login-btn']
*** Keywords ***
Part Profile
      Wait Until Element Is Visible   ${IconProfile_Btn}
      Click Element  ${IconProfile_Btn}
      Wait Until Element Is Visible   ${profile_Menu}
      Click Element  ${profile_Menu}
click my paasengers button  
      Wait Until Element Is Visible   ${My passengers_Button}
      Click Element  ${My passengers_Button} 
      



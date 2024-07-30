*** Settings ***
Documentation    خرید تشریفات 
Library           SeleniumLibrary
Resource          ../Setup/resources.robot
Resource    ../Pages/Home_page.robot
Resource    ../Pages/CIP_page.robot
Resource          ../Steps/CIP_step.robot



test Setup       Open Login Page Using Chrome Browser app
Test Teardown     Close Chrome Browser
*** Variables ***


*** Test Cases ***
buy Cip    
    search Cip
    Choose between results
    Sleep    3
    enter information of Cip book
    Sleep    3
    
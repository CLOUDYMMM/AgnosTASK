*** Settings ***
Resource          Resources/Variables.robot
Resource          Resources/CommonKeywords.robot
Library           SeleniumLibrary

*** Test Cases ***
Demo Login Test
    [Documentation]    Simple demo test to verify the fixed structure
    [Tags]    Demo
    Open Browser To Login Page
    Login With Valid Credentials
    Page Should Contain    Dashboard
    Close Browser

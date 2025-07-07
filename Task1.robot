*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Variables ***
${BROWSER}          Chrome
${SIGNUP_URL}       https://dev.app.agnoshealth.com/ai_dashboard/agnos/sign_up/
${LOGIN_URL}        https://dev.app.agnoshealth.com/ai_dashboard/login
${DASHBOARD_URL}    https://dev.app.agnoshealth.com/ai_dashboard/home
${USERNAME}         test@gmail.com
${PASSWORD}         Test1234!

# Locators
${EMAIL_INPUT}      id=Email
${PASSWORD_INPUT}   id=password
${CONFIRM_PASSWORD_INPUT}   xpath=(//input[@id='password'])[2]
${CONFIRM_BUTTON}   xpath=//button[.//div[text()='Confirm']]
${SIGNIN_BUTTON}    xpath=//button[contains(@class, '1lnk8p5')]
${LOGIN_BUTTON}     id=login
${LOGOUT_BUTTON}    id=logout
${SEARCH_BOX}       id=search
${TRIAGE_FILTER}    id=triage-filter
${DATE_FILTER}      id=date-filter
${CHANNEL_FILTER}   id=channel-filter
${DOWNLOAD_BTN}     id=download-btn

${DOWNLOAD_PATH}    C:/Users/Matichai/Downloads/record.csv

*** Keywords ***
Open Browser To Signup Page
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    Maximize Browser Window

Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Register New User
    Input Text      ${EMAIL_INPUT}    ${USERNAME}
    Input Text      ${PASSWORD_INPUT}    ${PASSWORD}
    Input Text      ${CONFIRM_PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${CONFIRM_BUTTON}
    Sleep    2s
    Wait Until Page Contains    Log-in    timeout=10s
    Page Should Not Contain    The password must be at least 8 characters long

Login With Valid Credentials
    Input Text      ${EMAIL_INPUT}    ${USERNAME}
    Input Text      ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${SIGNIN_BUTTON}
    Wait Until Location Is    ${DASHBOARD_URL}

Logout User
    Click Element   ${LOGOUT_BUTTON}
    Wait Until Location Is    ${LOGIN_URL}

Navigate Tabs
    Click Element   xpath=//a[text()='Dashboard']
    Click Element   xpath=//a[text()='Records']
    Click Element   xpath=//a[text()='Settings']

Filter By Triage
    Select From List By Value    ${TRIAGE_FILTER}    High
    Wait Until Page Contains    High Priority

Filter By Date
    Input Text      ${DATE_FILTER}    2024-06-01 to 2024-06-30
    Click Button    id=apply-date-filter
    Wait Until Page Contains    2024-06

Filter By Channel
    Select From List By Value    ${CHANNEL_FILTER}    Web
    Wait Until Page Contains    Web

Search For Record
    Input Text      ${SEARCH_BOX}    Test Record
    Press Keys      ${SEARCH_BOX}    ENTER
    Wait Until Page Contains    Test Record

Download Record As CSV
    Click Element    ${DOWNLOAD_BTN}
    Sleep    5s    # Wait for download
    File Should Exist    ${DOWNLOAD_PATH}

*** Test Cases ***
TC-0001 User Registration
    [Tags]    Registration
    Open Browser To Signup Page
    Register New User
    Page Should Contain    Login
    [Teardown]    Close Browser

TC-0002 User Login
    [Tags]    Login
    Open Browser To Login Page
    Login With Valid Credentials
    Page Should Contain    Dashboard
    [Teardown]    Close Browser

TC-0003 User Logout
    [Tags]    Logout
    Open Browser To Login Page
    Login With Valid Credentials
    Logout User
    Page Should Contain    Login
    [Teardown]    Close Browser

TC-0004 Navigation Between Tabs
    [Tags]    Navigation
    Open Browser To Login Page
    Login With Valid Credentials
    Navigate Tabs
    [Teardown]    Close Browser

TC-0005 Search for a Record
    [Tags]    Search
    Open Browser To Login Page
    Login With Valid Credentials
    Search For Record
    [Teardown]    Close Browser

TC-0006 Filter Records by Triage
    [Tags]    Filter
    Open Browser To Login Page
    Login With Valid Credentials
    Filter By Triage
    [Teardown]    Close Browser

TC-0007 Filter Records by Date
    [Tags]    Filter
    Open Browser To Login Page
    Login With Valid Credentials
    Filter By Date
    [Teardown]    Close Browser

TC-0008 Filter Records by Channel
    [Tags]    Filter
    Open Browser To Login Page
    Login With Valid Credentials
    Filter By Channel
    [Teardown]    Close Browser

TC-0009 Download Records
    [Tags]    Download
    Open Browser To Login Page
    Login With Valid Credentials
    Download Record As CSV
    [Teardown]    Close Browser

    
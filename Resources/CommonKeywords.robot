*** Settings ***
Resource    Variables.robot
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Open Browser To Signup Page
    Open Browser    ${SIGNUP_URL}    ${BROWSER}
    Maximize Browser Window

Register New User
    [Arguments]    ${email}    ${password}
    Input Text    ${EMAIL_FIELD}    ${email}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Wait Until Element Is Visible    ${CONFIRM_PASSWORD_FIELD}    timeout=10s
    Input Text    ${CONFIRM_PASSWORD_FIELD}    ${password}
    Sleep    1s
    Click Button    ${REGISTER_BUTTON}
    Wait Until Page Contains    Log-in    timeout=10s
    Page Should Not Contain    The password must be at least 8 characters long

Login With Valid Credentials
    Input Text    ${EMAIL_FIELD}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Location Is    ${DASHBOARD_URL}
    Page Should Contain    Dashboard

Logout User
    Click Element    ${LOGOUT_BUTTON}
    Wait Until Location Is    ${LOGIN_URL}
    Page Should Contain    Login

Navigate Through Tabs
    Click Element    ${DASHBOARD_TAB}
    Wait Until Page Contains    Dashboard
    Click Element    ${RECORDS_TAB}
    Wait Until Page Contains    Records
    Click Element    xpath=//a[text()='Settings']
    Wait Until Page Contains    Settings

Search For Record
    [Arguments]    ${search_term}
    Input Text    ${SEARCH_INPUT}    ${search_term}
    Press Keys    ${SEARCH_INPUT}    ENTER
    Wait Until Page Contains    ${search_term}

Filter Records
    [Arguments]    ${filter_dropdown}    ${filter_option}    ${expected_text}
    Select From List By Value    ${filter_dropdown}    ${filter_option}
    Wait Until Page Contains    ${expected_text}

Filter Records By Date
    [Arguments]    ${start_date}    ${end_date}
    Input Text    ${DATE_FILTER}    ${start_date} to ${end_date}
    Click Button    id=apply-date-filter
    Wait Until Page Contains    ${start_date}

Filter Records By Channel
    [Arguments]    ${channel}
    Filter Records    ${CHANNEL_FILTER}    ${channel}    ${channel}

Filter Records By Triage
    [Arguments]    ${priority}
    Filter Records    ${TRIAGE_FILTER}    ${priority}    ${priority} Priority

Download Records As CSV
    [Arguments]    ${file_path}
    Click Element    ${DOWNLOAD_BUTTON}
    Wait For File    ${file_path}

Wait For File
    [Arguments]    ${path}    ${timeout}=30s
    Wait Until Keyword Succeeds    ${timeout}    5s    File Should Exist    ${path}

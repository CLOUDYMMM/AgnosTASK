*** Settings ***
Documentation     A test suite for the Agnos Health AI Dashboard.
...               This suite includes tests for user registration, login,
...               logout, navigation, and record management.

Library           SeleniumLibrary
Library           DateTime

Resource          Resources/Variables.robot
Resource          Resources/CommonKeywords.robot

Test Setup        Open Browser To Login Page
Test Teardown     Close Browser

*** Test Cases ***
TC-0001: User Registration
    [Documentation]    Verify that a new user can register successfully.
    [Tags]    Registration
    [Setup]    Open Browser To Signup Page
    Register New User    test@gmail.com    Test1234!
    Page Should Contain    Login

TC-0002: User Login and Logout
    [Documentation]    Verify that a registered user can log in and out.
    [Tags]    Login    Logout
    Login With Valid Credentials
    Logout User

TC-0003: Navigation Between Tabs
    [Documentation]    Verify that a logged-in user can navigate between tabs.
    [Tags]    Navigation
    Login With Valid Credentials
    Navigate Through Tabs

TC-0004: Search for a Record
    [Documentation]    Verify that a user can search for a record.
    [Tags]    Search
    Login With Valid Credentials
    Search For Record    Test Record

TC-0005: Filter Records
    [Documentation]    Verify that a user can filter records by different criteria.
    [Tags]    Filter
    Login With Valid Credentials
    Filter Records    ${TRIAGE_FILTER}    High    High Priority
    Filter Records    ${CHANNEL_FILTER}   Web     Web

TC-0006: Download Records
    [Documentation]    Verify that a user can download records as a CSV file.
    [Tags]    Download
    Login With Valid Credentials
    Download Records As CSV
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    file:///C:/Users/User/Desktop/ep01/ep01_small_excersice.html
${USERNAME}    myuser
${PASSWORD}    mypass
${NICKNAME}    mynick

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    Chrome
Fill Login Form
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Input Text    name=nickname    ${NICKNAME}
Select DropdownList
    Select From List By Label    xpath=//select[@name='piof-ddo']    Doppio
Check Robot Is Easy
    Click Element    xpath=//input[@type='checkbox' and @value='Robot is easy']
Submit Form
    Click Button    xpath=//input[@type='submit' and @value='Click ME to Finish !!']

*** Test Cases ***
Fill Form And Submit
    Open Browser To Login Page
    Fill Login Form
    Select DropdownList    
    Check Robot Is Easy
    Submit Form
    [Teardown]    Close Browser
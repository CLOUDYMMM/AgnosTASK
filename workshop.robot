*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    file:///C:/Users/User/Desktop/ep01/ep01_small_excersice.html
${USERNAME}    myuser
${PASSWORD}    mypass
${NICKNAME}    mynick

*** Test Cases ***
Fill Form And Submit
    Open Browser    ${URL}    Chrome
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Input Text    name=nickname    ${NICKNAME}
    Select From List By Label    xpath=//select[@name='piof-ddo']    Doppio
    Click Element    xpath=//input[@type='checkbox' and @value='Robot is easy']
    Click Button    xpath=//input[@type='submit' and @value='Click ME to Finish !!']
    [Teardown]    Close Browser
*** Variables ***
${BASE_URL} =         https://dev.app.agnoshealth.com/ai_dashboard
${LOGIN_URL} =        ${BASE_URL}/login
${SIGNUP_URL} =       ${BASE_URL}/agnos/sign_up/
${DASHBOARD_URL} =    ${BASE_URL}/home
${BROWSER} =          Chrome

# Test Credentials
${VALID_USERNAME} =   test@gmail.com
${VALID_PASSWORD} =   Test1234!

# File Paths
${DOWNLOAD_FILE_PATH} =    ${OUTPUT DIR}${/}records.csv

# Element Locators
${EMAIL_FIELD} =                 id=Email
${PASSWORD_FIELD} =              id=password
${CONFIRM_PASSWORD_FIELD} =      xpath=(//input[@type='password'])[2]
${REGISTER_BUTTON} =             xpath=//button[normalize-space(.)='Confirm']
${LOGIN_BUTTON} =                xpath=//button[normalize-space(.)='Sign in']
${DASHBOARD_TITLE} =             xpath=//h1[contains(text(),'Dashboard')]
${PROFILE_DROPDOWN} =            id=profile-dropdown
${LOGOUT_BUTTON} =               id=logout

${RECORDS_TAB} =                 xpath=//a[text()='Records']
${RECORDS_TITLE} =               xpath=//h1[contains(text(),'Records')]
${DASHBOARD_TAB} =               xpath=//a[text()='Dashboard']

${SEARCH_INPUT} =                id=search
${SEARCH_BUTTON} =               id=search-button

${TRIAGE_FILTER} =               id=triage-filter
${DATE_FILTER} =                 id=date-filter
${CHANNEL_FILTER} =              id=channel-filter

${DOWNLOAD_BUTTON} =             id=download-btn

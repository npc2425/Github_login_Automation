*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To GitHub
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}        chrome
${GITHUB_URL}     https://github.com/login
${USERNAME}       npc2425
${PASSWORD}       2429@Praveen
${DELAY}          0.5

*** Test Cases ***
Login To GitHub
    Input Username
    Input Password
    Submit Credentials
    Verify Successful Login

*** Keywords ***
Open Browser To GitHub
    Open Browser    ${GITHUB_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Username
    Wait Until Element Is Visible    id=login_field
    Input Text    id=login_field    ${USERNAME}

Input Password
    Wait Until Element Is Visible    id=password
    Input Text    id=password    ${PASSWORD}

Submit Credentials
    Click Button    name=commit

Verify Successful Login
    Wait Until Page Contains Element    xpath=//summary[@aria-label="View profile and more"]
    Page Should Contain Element    xpath=//summary[@aria-label="View profile and more"]
    Log    Login Successful
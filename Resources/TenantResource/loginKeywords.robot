*** Settings ***
Library  SeleniumLibrary
Resource    ../../PageObjects/TenantObjects/Login.robot

*** Keywords ***
Open the application
    [Arguments]      ${URL}    ${browser}
    Open Browser    ${url}    ${browser}

Login To Application
    [Arguments]    ${username}    ${pwd}

    Input Text    ${login_EmailOrMobile}    ${username}
    Input Text    ${login_password}    ${pwd}
    Click Element    ${signIn_btn}
    Sleep    5s

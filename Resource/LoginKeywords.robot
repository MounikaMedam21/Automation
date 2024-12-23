*** Settings ***
Library  SeleniumLibrary
Variables  ../Config/Properties.py
Resource    ../PageObjects/LoginObjects.robot
*** Keywords ***
Open the application
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Log    Waiting for sign header to be visible
    Wait Until Element Is Visible    ${sign_header}    30s


Login To Application
    [Arguments]    ${username}    ${pwd}

    Input Text    ${login_EmailOrMobile}    ${username}
    Input Text    ${login_password}    ${pwd}
    Click Element    ${signIn_btn}
    Sleep    5s

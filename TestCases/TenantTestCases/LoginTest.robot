*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/TenantResource/loginKeywords.robot

Suite Setup    Open the application    ${url}    ${browser}

*** Test Cases ***
LoginTest
    Login To Application    9493408792  Test@123
*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/TenantResource/loginKeywords.robot
Resource     ../../Resources/FilesResource/FilesKeywords.robot
Suite Setup     Open the application    ${url}    ${browser}

*** Test Cases ***
Manage Files
    Login To Application    9493408792  Test@123
    sleep   3s
    Search for the Username     Bhanu1 Prasad1
    Click on the 3 dots tooltip
    Click on the files
    Check validation messages for new files

*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/TeamsManagementKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Check Teams Management Tab
#    set selenium timeout    2s
    Login To Application    9493408792  Test@123
    Click on the teams management tab

Verify the user able see the data with active status
    Verify the status with active status

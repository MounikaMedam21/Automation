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
    Verify teams management page elements
Check the status functionality
#    Verify the status with active status
#    Verify the status with inactive status
    Verify the status with all status






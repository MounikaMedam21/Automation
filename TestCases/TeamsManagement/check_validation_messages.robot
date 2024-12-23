*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/TeamsManagementKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Check Teams Management Tab
    set selenium timeout    3s
    Login To Application    9493408792  Test@123
    Click on the teams management tab
Verify that all elements are visible on the team dashboard page
    Verify the all elements on the create new schedule page
Verify the validation messages on the team dashboard page
    Check the validations in the create new schedule dashboard page
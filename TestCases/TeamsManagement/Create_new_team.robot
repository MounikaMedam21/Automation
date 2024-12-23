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
Verify user able to create new team
    Verify user able to create new team     New Team    Iguroo Team    Hello     Teacher Vipul   raja learner






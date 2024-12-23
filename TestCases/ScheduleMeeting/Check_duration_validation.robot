*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/SchedulingKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Verify user able to navigate to the scheduling page
    Login To Application    9493408792  Test@123
    Click on the scheduling tab
    Click on the New Schedule button
    sleep   3s
Verify that should display a valiadtion message for time duration field
    Check the validation message for the time duration field    Creating    Good Morning      https://google.com
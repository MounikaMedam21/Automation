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
Verify user able to navigate to the schedule home page
    Click on the back button

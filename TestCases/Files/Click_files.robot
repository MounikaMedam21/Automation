*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/FileKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Manage Files
    Login To Application    9493408792  Test@123
    sleep   3s
    Click on the files

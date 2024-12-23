*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot

Suite Setup    Open the application
*** Test Cases ***
LoginTest
    Login To Application    9493408792  Test@123

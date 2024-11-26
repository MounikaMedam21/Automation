*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/TenantResource/loginKeywords.robot
Resource     ../../Resources/TenantResource/TenantRegistration.robot
Suite Setup     Open the application

*** Test Cases ***
Test Tenant Registration
    Login To Application    9493408792  Test@123
    sleep   13s
    Click on the tenant registration tab
*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/TenantResource/loginKeywords.robot
Resource     ../../Resources/TenantResource/TenantRegistration.robot
Suite Setup     Open the application

*** Test Cases ***
Test Tenant Registration
    Login To Application    9493408792  Test@123
    sleep   3s
    Click on the tenant registration tab
    Click on the create button
    Check the about tenant validation message   HIG Technology   hig   Hanvidh     Vid     +913740968084   hanvidh629.vvidh@yopmail.com    +913740968084   India


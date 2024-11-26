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
    Check the country validation message   HIG Technology   hig   Hello     Hadvidh     Vid   +15463453763  hanvidh629.vvidh@yopmail.com    +913740968084


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
    Fill Tenant Registration Form   Software Testing4    ST4     ABC     BHG     LKJ     Hyderabad   Telangana   India   Hello   Hanvidh     Vid   hanvidh629.vvidh@yopmail.com    +913740968084   India




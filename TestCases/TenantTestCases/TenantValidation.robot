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
    Click on the create button
    Fill Tenant Registration Form   HIG Technology    ghl     ABC     BHG     LKJ     Hyderabad   Telangana   India   Hello   Hanvidh     Vid     +914436437367   hanvidh.dh.vvidh@yopmail.com    +914436437367   India
    Check the success message for the new tenant


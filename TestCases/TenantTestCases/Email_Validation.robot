*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/TenantKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Test Tenant Registration
    Login To Application    9493408792  Test@123
    sleep   13s
    Click on the tenant registration tab
    Click on the create button
    Fill Tenant Registration Form   HIG Technology    rfv     ABC     BHG     LKJ     Hyderabad   Telangana   India   Hello   Hanvidh     Vid     +12635264563   sanju.reddy24@yopmail.com    +914436437367   India
    Check the error message for the existing email



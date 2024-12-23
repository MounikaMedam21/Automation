*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/TenantKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Test Tenant Registration
    Login To Application    9493408792  Test@123
    sleep   3s
    Click on the tenant registration tab
    Click on the create button
    Check the domain name validation message       HIG Technology   Hello   Hanvidh     Vid     +913740968084   hanvidh629.vvidh@yopmail.com    +913740968084   India


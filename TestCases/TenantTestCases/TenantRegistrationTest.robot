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

    Fill Tenant Registration Form   Software Testing4    ST4     ABC     BHG     LKJ     Hyderabad   Telangana   India   Hello   Hadhvitha     Reddy   hadhvitha.reddy12@yopmail.com     +915344652323   +915436435463      India




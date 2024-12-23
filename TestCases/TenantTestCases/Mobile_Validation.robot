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
    Fill Tenant Registration Form   HIG Technology    kte    ABC     BHG     LKJ     Hyderabad   Telangana   India   Hello   Hanvidh     Vid     +13355464546   hanvidh.dh.vvidh@yopmail.com    +914436437367   India
    Check the success message for the new tenant



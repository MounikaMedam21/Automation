*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resource/LoginKeywords.robot
Resource     ../../Resource/SchedulingKeywords.robot
Suite Setup     Open the application

*** Test Cases ***
Verify user able to navigate to the scheduling page
    Login To Application    9493408792  Test@123
    Click on the scheduling tab
#    Click on the New Schedule button

#Verify user able to see the all fields in the dashboard page
#    Verify the all elements on the create new schedule page

#Verify user able to create new meeting
#    Fill the form to create new schedule    Creating Meeting for AWS     Good Morning      https://google.com   Iguroo team     raj learner
Verify that user is able to search with valid name
    Check the search functionality      Update the meeting detail

Verify user able to update the meeting detals
    Update the scheduleded meeting details      Update the meeting details1
    Check the success message for the updated details



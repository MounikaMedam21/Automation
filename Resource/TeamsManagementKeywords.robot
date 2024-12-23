*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/TeamsObjects.robot
Resource  ../PageObjects/CommonObjects.robot

*** Keywords ***
Click on the teams management tab
    wait until element is visible   ${btn_TeamsMagTab}     30s
    click element   ${btn_TeamsMagTab}

Verify teams management page elements
    Element should be visible   ${Teams_heading}
    Element should be visible   ${txt_Search_Name}
    Element should be visible   ${btn_Search}
    Element should be visible   ${drp_Status}
    Element should be visible   ${btn_Newteam}
    Element should be visible   ${All_tab}
    Element should be visible   ${Team_tab}
    Element should be visible   ${Cohort_tab}
    Element should be visible   ${Group_tab}

Verify user able to create new team
    [Arguments]  ${team_name}   ${enter_parent_type}    ${description}  ${user_name}    ${student_name}
    click element   ${btn_Newteam}
    sleep   3s
    input text  ${txt_Teamname}     ${team_name}
    wait until element is visible   ${Team_type}    timeout=30
    click element  ${Team_type}
    wait until element is visible   ${Select_group}     timeout=30
    click element  ${Select_group}

    #Select date
    #[Arguments]        ${year}
    click element   ${Date_picker}
    Input Text    (//input[@name='year'])[1]    2024
    sleep   3s
    Input Text   (//input[@name='month' and contains(@class, 'react-date-picker__inputGroup__month')])[1]    12
    Sleep    3s
    Input Text    (//input[@name='day' and contains(@class, 'react-date-picker__inputGroup__day')])[1]    22


    Sleep    15s
    ${year}    Get Value    (//input[@name='year'])[1]
    # Retrieve the value of the month input field
    ${month_value}    Get Value    (//input[@name='month'])[1]

    # Check if there's a leading zero span for months 1-9
    ${leading_zero}    Run Keyword And Return Status    Element Should be visible    //span[@class='react-date-picker__inputGroup__leadingZero']

    # Combine leading zero (if present) with the month value
    ${final_month_value}    Set Variable If    ${month_value} < 10    0${month_value}    ${month_value}
    ${day}     Get Value    (//input[@name='day'])[1]
    # Check if there's a leading zero span for months 1-9
    ${leading_zero}    Run Keyword And Return Status    Element Should be visible    //span[@class='react-date-picker__inputGroup__leadingZero']

    ${final_day_value}    Set Variable If    ${day} < 10    0${day}    ${day}
    # Combine them to form the selected date
    ${selected_date}    Set Variable    ${final_month_value}/${final_day_value}/${year}
    Should Be Equal    ${selected_date}    12/22/2024


    click element   ${Date_picker1}
    Input Text    (//input[@name='year'])[2]    2024
    sleep   3s
    Input Text   (//input[@name='month' and contains(@class, 'react-date-picker__inputGroup__month')])[2]    12
    Sleep    3s
    Input Text    (//input[@name='day' and contains(@class, 'react-date-picker__inputGroup__day')])[2]    25


    Sleep    15s
    ${year}    Get Value    (//input[@name='year'])[2]
    # Retrieve the value of the month input field
    ${month_value}    Get Value    (//input[@name='month'])[2]

    # Check if there's a leading zero span for months 1-9
    ${leading_zero}    Run Keyword And Return Status    Element Should be visible    //span[@class='react-date-picker__inputGroup__leadingZero']

    # Combine leading zero (if present) with the month value
    ${final_month_value}    Set Variable If    ${month_value} < 10    0${month_value}    ${month_value}
    ${day}     Get Value    (//input[@name='day'])[2]
    # Check if there's a leading zero span for months 1-9
    ${leading_zero}    Run Keyword And Return Status    Element Should be visible    //span[@class='react-date-picker__inputGroup__leadingZero']

    ${final_day_value}    Set Variable If    ${day} < 10    0${day}    ${day}
    # Combine them to form the selected date
    ${selected_date}    Set Variable    ${final_month_value}/${final_day_value}/${year}
    Should Be Equal    ${selected_date}    12/25/2024
    input text  ${txt_Description}  ${description}
    input text      ${Search_user}    ${user_name}
    click element   ${Search_user}
    wait until element is visible   ${Click_listarrow}
    click element    ${Click_listarrow1}
    input text      ${Search_students}      ${student_name}
    click element   ${select_student}
    click element    ${Click_listarrow1}
    # Click on the "save" button
    click element    ${btn_Save}
#    click element   ${btn_SaveandAddNew}
    ${success}=     get text    ${Success_pop-up}
    Element Should Contain      ${Success_pop-up}    ${success}
    Should Be Equal     ${success}      Group is updated successfully
Search with valid name
    [Arguments]     ${name}
    input text  ${txt_Search_Name}  ${name}
    click element   ${btn_Search}
    wait until element is visible   ${Action_3dots}     timeout=30
    sleep   3s
    click element   ${Action_3dots}
    click element   ${Edit_icon}
    clear element text  ${txt_Teamname}
    input text  ${txt_Teamname}     ${name}
    sleep   3s
    click element    ${btn_Save}
Check the success message for the updated details
    wait until element is visible   ${update_success_pop-up}    timeout=30
    ${success}=     get text    ${update_success_pop-up}
    Element Should Contain      ${Update_success_pop-up}     ${success}
    Should Be Equal     ${success}   Group is updated successfully

Search with invalid name
    [Arguments]     ${name}
    input text  ${txt_Search_Name}  ${name}
    click element   ${btn_Search}
    wait until element is visible   ${invalid_data}     timeout=30

Verify the status with active status
    click element   ${drp_Status}
    wait until element is visible    ${Select_active_status}    30s
    click element   ${Select_active_status}
Verify the status with inactive status
    click element   ${drp_Status}
    wait until element is visible    ${Select_inactive_status}    30s
    click element   ${Select_inactive_status}

Verify the status with all status
    click element   ${drp_Status}
    wait until element is visible    ${Select_all_status}    30s
    click element   ${Select_all_status}
Verify the all elements on the create new schedule page
    click element   ${btn_Newteam}
    Element should be visible   ${txt_Teamname}
    Element should be visible   ${Team_type}
    Element should be visible   ${Parent_type}
    Element should be visible   ${Date_picker}
    Element should be visible   ${Date_picker1}
    Element should be visible   ${btn_Save}
    Element should be visible   ${btn_SaveandAddNew}

Check the validations in the create new schedule dashboard page
#    click element   ${btn_Newteam}
    Execute JavaScript    window.scrollTo(0, 1000)
    Wait Until Element Is Visible   ${btn_Save}   timeout=30
    Click Element   ${btn_Save}
    Wait Until Element Is Visible   ${Team_name_validation}   timeout=30
    Wait Until Element Is Visible   ${Team_type_validation}   timeout=30
    Wait Until Element Is Visible   ${start_date_validation}   timeout=30
    Wait Until Element Is Visible   ${end_date_validation}     timeout=30

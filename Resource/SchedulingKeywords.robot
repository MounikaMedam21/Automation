*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/SchedulingObjects.robot
Resource  ../PageObjects/CommonObjects.robot
*** Keywords ***
Click on the scheduling tab
    wait until element is visible   ${Scheduling_Tab}     30s
    click element   ${Scheduling_Tab}

Verify scheduling page elements
    Element should be visible   ${Schedule_heading}
    Element should be visible   ${btn_newschedule}
    Element should be visible   ${txt_search}
    Element should be visible   ${btn_search}
    Element should be visible   ${All_tab}
    Element should be visible   ${Past_tab}
    Element should be visible   ${Upcoming_tab}
Click on the New Schedule button
    wait until element is visible   ${btn_newschedule}
    click element   ${btn_newschedule}
Click on the back button
    sleep   3s
    click element   ${btn_backbutton}
Verify the all elements on the create new schedule page
    Element should be visible   ${dashboard_heading}
    Element should be visible   ${txt_meeting_name}
    Element should be visible   ${txt_description}
    Element should be visible   ${Date_picker}
    Element should be visible   ${Time_dropdown}
    Element should be visible   ${Duration_dropdown}
    Element should be visible   ${TimeZone_dropdown}
    Element should be visible   ${txt_meeting_link}
    Element should be visible   ${24hr_prior_checkbox}
    Element should be visible   ${1hr_prior_checkbox}
    Element should be visible   ${repetitions}
    Element should be visible   ${no.of_repetitions}
    Element should be visible   ${Search_user}
    Element should be visible   ${Click_listarrow1}
    Element should be visible   ${Click_listarrow2}
    Element should be visible   ${Search_group}
    Element should be visible   ${Click_user_listarrow1}
    Element should be visible   ${Click_user_listarrow2}
    Element should be visible   ${Save_button}
    Element should be visible   ${SaveandAddnew_button}


Fill the form to create new schedule
    [Arguments]  ${meeting_name}     ${enter_description}   ${enter_meeting_link}   ${group_name}   ${user_name}
#    click element   ${btn_newschedule}
    wait until element is visible   ${Meeting_name}     timeout=30
    input text  ${txt_meeting_name}     ${meeting_name}
    input text  ${txt_description}  ${enter_description}
    wait until element is visible   ${Date_picker}  timeout=30
    click element   ${Date_picker}
    sleep   2s
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
    click element   ${Time_dropdown}
    wait until element is visible  ${Select_time}
    click element  ${Select_time}
    click element   ${Duration_dropdown}
    click element   ${Select_duration}

    wait until element is visible   ${TimeZone_dropdown}    timeout=30
    click element   ${TimeZone_dropdown}
    # select the 'Kolkata'(INDIA) time zone
    Execute JavaScript    window.scrollTo(0, 1000)
    wait until element is visible   ${Select_India_timezone}    timeout=30
    click element   ${Select_India_timezone}
#    click element   ${Select_Chicago_timezone}
#    click element   ${Select_Newyork_timezone}
#    click element   ${Select_Losangeles_timezone}
    input text      ${txt_meeting_link}     ${enter_meeting_link}
    click element   ${24hr_prior_checkbox}
    click element   ${1hr_prior_checkbox}
    input text      ${Search_group}    ${group_name}
    click element   ${Select_group}
    wait until element is visible   ${Click_listarrow1}
    click element    ${Click_listarrow1}
    input text      ${Search_user}      ${user_name}
    click element   ${Select_user}
    click element    ${Click_user_listarrow1}
    # Click on the "save" button
    click element    ${Save_button}
    # Click on the "Save and Add New button"
#    click element   ${SaveandAddnew_button}
    #check the success pop-up message
    ${success}=     get text    ${Success_pop-up}
    Element Should Contain      ${Success_pop-up}    ${success}
    Should Be Equal     ${success}      Meeting created successfully
Check the search functionality
    [Arguments]     ${entername}
    wait until element is visible   ${txt_search}   timeout=30
    input text  ${txt_search}   ${entername}
    click element   ${btn_search}
    sleep   3s
Update the scheduleded meeting details
    [Arguments]  ${clear_meetingname}
    wait until element is visible   ${btn_3dots}    timeout=30
    sleep   3s
    click element   ${btn_3dots}
    click element   ${edit_icon}
    wait until element is visible   ${txt_meeting_name}     timeout=30
    clear element text  ${txt_meeting_name}
    Input Text    ${txt_meeting_name}    ${clear_meetingname}
    Execute JavaScript    window.scrollTo(0, 1000)
    sleep   6s
    click element   ${Save_button}
Check the success message for the updated details
    ${success}=     get text    ${Update_success_pop-up}
    Element Should Contain      ${Update_success_pop-up}     ${success}
    Should Be Equal     ${success}   Meeting updated successfully
Search with invalid meeting name
    [Arguments]     ${enter_invalid_name}
    wait until element is visible   ${txt_search}   timeout=30
    input text  ${txt_search}   ${entername}
    click element   ${btn_search}
    sleep   3s
Check the validations in the create new schedule dashboard page
#    click element   ${btn_newschedule}
    Wait Until Element Is Visible   ${Save_button}   timeout=30
    Click Element   ${Save_button}
    Wait Until Element Is Visible   ${meeting_name_validation}   timeout=30
    Wait Until Element Is Visible   ${start_date_validation}   timeout=30
    Wait Until Element Is Visible   ${time_validation}   timeout=30
    Wait Until Element Is Visible   ${duration_validation}   timeout=30
    Wait Until Element Is Visible   ${timezone_validation}   timeout=30
    Wait Until Element Is Visible   ${meeting_link_validation}   timeout=30

Check the validation message for the meeting name field
    [Arguments]       ${enter_description}   ${enter_meeting_link}
    input text  ${txt_description}  ${enter_description}
    wait until element is visible   ${Date_picker}  timeout=30
    click element   ${Date_picker}
    sleep   2s
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
    click element   ${Time_dropdown}
    wait until element is visible  ${Select_time}
    click element  ${Select_time}
    click element   ${Duration_dropdown}
    click element   ${Select_duration}

    wait until element is visible   ${TimeZone_dropdown}    timeout=30
    click element   ${TimeZone_dropdown}
    # select the 'Kolkata'(INDIA) time zone
#    Execute JavaScript    window.scrollTo(0, 1000)
    wait until element is visible   ${Select_India_timezone}    timeout=30
    click element   ${Select_India_timezone}
    input text      ${txt_meeting_link}     ${enter_meeting_link}
    # Click on the "save" button
    click element    ${Save_button}
    wait until element is visible   ${meeting_name_validation}
Check the validation message for the start date field
    [Arguments]      ${meeting_name}     ${enter_description}   ${enter_meeting_link}
    wait until element is visible   ${txt_meeting_name}     timeout=30
    input text  ${txt_meeting_name}     ${meeting_name}
    input text  ${txt_description}  ${enter_description}
    click element   ${Time_dropdown}
    wait until element is visible  ${Select_time}
    click element  ${Select_time}
    click element   ${Duration_dropdown}
    click element   ${Select_duration}
#    wait until element is visible   ${India_timezone}    timeout=30
#    click element   ${India_timezone}
#    # select the 'Kolkata'(INDIA) time zone
##    Execute JavaScript    window.scrollTo(0, 1000)
#    wait until element is visible   ${Select_Chicago_timezone}    timeout=30
#    click element   ${Select_Chicago_timezone}
    input text      ${txt_meeting_link}     ${enter_meeting_link}
    # Click on the "save" button
    click element    ${Save_button}
    wait until element is visible   ${start_date_validation}
Check the validation for empty time field
    [Arguments]       ${meeting_name}   ${enter_description}   ${enter_meeting_link}
    wait until element is visible   ${txt_meeting_name}     timeout=30
    input text  ${txt_meeting_name}     ${meeting_name}
    input text  ${txt_description}  ${enter_description}
    wait until element is visible   ${Date_picker}  timeout=30
    click element   ${Date_picker}
    sleep   2s
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
    click element   ${Duration_dropdown}
    click element   ${Select_duration}

    wait until element is visible   ${TimeZone_dropdown}    timeout=30
    click element   ${TimeZone_dropdown}
    # select the 'Kolkata'(INDIA) time zone
#    Execute JavaScript    window.scrollTo(0, 1000)
    wait until element is visible   ${Select_India_timezone}    timeout=30
    click element   ${Select_India_timezone}
    input text      ${txt_meeting_link}     ${enter_meeting_link}
    # Click on the "save" button
    click element    ${Save_button}
    wait until element is visible   ${time_validation}
Check the validation message for the time duration field
    [Arguments]       ${meeting_name}   ${enter_description}   ${enter_meeting_link}
    wait until element is visible   ${txt_meeting_name}     timeout=30
    input text  ${txt_meeting_name}     ${meeting_name}
    input text  ${txt_description}  ${enter_description}
    wait until element is visible   ${Date_picker}  timeout=30
    click element   ${Date_picker}
    sleep   2s
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
    click element   ${Time_dropdown}
    wait until element is visible  ${Select_time}
    click element  ${Select_time}
    wait until element is visible   ${TimeZone_dropdown}    timeout=30
    click element   ${TimeZone_dropdown}
    # select the 'Kolkata'(INDIA) time zone
#    Execute JavaScript    window.scrollTo(0, 1000)
    wait until element is visible   ${Select_India_timezone}    timeout=30
    click element   ${Select_India_timezone}
    input text      ${txt_meeting_link}     ${enter_meeting_link}
    # Click on the "save" button
    click element    ${Save_button}
    wait until element is visible   ${duration_validation}
Check the validation message for the time zone field
    [Arguments]       ${meeting_name}   ${enter_description}   ${enter_meeting_link}
    wait until element is visible   ${txt_meeting_name}     timeout=30
    input text  ${txt_meeting_name}     ${meeting_name}
    input text  ${txt_description}  ${enter_description}
    wait until element is visible   ${Date_picker}  timeout=30
    click element   ${Date_picker}
    sleep   2s
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
    click element   ${Time_dropdown}
    wait until element is visible  ${Select_time}
    click element  ${Select_time}
    click element   ${Duration_dropdown}
    click element   ${Select_duration}
    input text      ${txt_meeting_link}     ${enter_meeting_link}
    # Click on the "save" button
    click element    ${Save_button}
    wait until element is visible   ${timezone_validation}
Check the validation message for the meeting link field
    [Arguments]       ${meeting_name}   ${enter_description}
    wait until element is visible   ${txt_meeting_name}     timeout=30
    input text  ${txt_meeting_name}     ${meeting_name}
    input text  ${txt_description}  ${enter_description}
    wait until element is visible   ${Date_picker}  timeout=30
    click element   ${Date_picker}
    sleep   2s
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
    click element   ${Time_dropdown}
    wait until element is visible  ${Select_time}
    click element  ${Select_time}
    click element   ${Duration_dropdown}
    click element   ${Select_duration}

    wait until element is visible   ${TimeZone_dropdown}    timeout=30
    click element   ${TimeZone_dropdown}
    # select the 'Kolkata'(INDIA) time zone
#    Execute JavaScript    window.scrollTo(0, 1000)
    wait until element is visible   ${Select_India_timezone}    timeout=30
    click element   ${Select_India_timezone}
    # Click on the "save" button
    click element    ${Save_button}
    wait until element is visible   ${meeting_link_validation}
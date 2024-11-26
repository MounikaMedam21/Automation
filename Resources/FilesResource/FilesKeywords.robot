*** Settings ***
Library   SeleniumLibrary
Resource    ../../PageObjects/FilesObjects/My_Files.robot
*** Variables ***
${Pdf_file}   Anujaone.pdf
*** Keywords ***
Search for the Username
    [Arguments]   ${username}
    wait until element is visible   ${Search_username}      timeout=30
    input text  ${Search_username}  ${username}
    click element   ${btn_Search}
    sleep   10s
    Execute JavaScript    window.scrollBy(-1000, 0)
Click on the 3 dots tooltip
    wait until element is visible   ${Tooptip}      timeout=30
    click element   ${Tooptip}
Click on the files
    click element   ${Files_tooltip}
Fill the all the details for rubric file type
    click element   ${File_type}
    wait until element is visible   ${Select_rubric_file}
    click element   ${Select_rubric_file}
    choose file   ${Choose_file}    ${CURDIR}${/}${Pdf_file}
    click button  ${btn_upload}
Fill the all the details for personalized learning path
    click element   ${File_type}
    wait until element is visible   ${Select_learning_type}
    click element   ${Select_learning_type}
    choose file   ${Choose_file}    ${CURDIR}${/}${Pdf_file}
    click button  ${btn_upload}
Fill the all details for report file type
    click element   ${File_type}
    wait until element is visible   ${Select_report_type}
    click element   ${Select_report_type}
    choose file   ${Choose_file}    ${CURDIR}${/}${Pdf_file}
    click button  ${btn_upload}
Fill the all details for others file type
    [Arguments]     ${entername}
    click element   ${File_type}
    wait until element is visible   ${Select_others_type}
    click element   ${Select_others_type}
    input text  ${File_name}    ${entername}
    choose file   ${Choose_file}    ${CURDIR}${/}${Pdf_file}
    click button  ${btn_upload}
Click on the preview tooltip
    click element   ${Preview_tooltip}
    click button    ${Close_button}
    click element   ${btn_yes}
    click element   ${btn_no}
Click on the delete to delete the uploaded files
    click element   ${Delete_files}
    click element   ${btn_yes}
    click element   ${btn_no}

Check validation messages for new files
    click button  ${btn_upload}
    wait until element is visibel   ${File_type_validation}
    wait until element is visibel   ${File_name_validation}
    wait until element is visibel   ${Choose_file_validation}
Check validation message for minimum characters
    [Arguments]   ${filename}
    click element   ${File_type}
    wait until element is visible   ${Select_others_type}
    click element   ${Select_others_type}
    input text  ${File_name}    ${filename}
    click element   ${Choose_file}
    click button  ${btn_upload}
    wait until element is visibel   ${Characters_validation}
Check validation message for maximum characters
    [Arguments]   ${username}   ${filename}
    click element   ${File_type}
    wait until element is visible   ${Select_others_type}
    click element   ${Select_others_type}
    input text  ${File_name}    ${filename}
    click element   ${Choose_file}
    click button  ${btn_upload}
    wait until element is visibel   ${Exceeded_limit_validation}
Check validation for the uniques name
    [Arguments]   ${username}   ${filename}
    click element   ${File_type}
    wait until element is visible   ${Select_others_type}
    click element   ${Select_others_type}
    input text  ${File_name}    ${filename}
    click element   ${Choose_file}
    click button  ${btn_upload}
    wait until element is visibel   ${Unique_name}




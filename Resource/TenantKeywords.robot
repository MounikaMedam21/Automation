*** Settings ***
Library   SeleniumLibrary
Library    FakerLibrary
Resource  ../PageObjects/TenantObjects.robot
Resource  ../PageObjects/CommonObjects.robot

*** Keywords ***
Click on the tenant registration tab
    wait until element is visible   ${btn_TenantRegTab}     30s
    click element   ${btn_TenantRegTab}
#    sleep   30s
Click on the create button
    wait until element is visible   ${btn_Create}
    click element   ${btn_Create}



Fill Tenant Registration Form
    [Arguments]   ${FullName}   ${DomainName}   ${Line1}    ${Line2}    ${Line3}    ${City}  ${State}   ${Country}   ${About}    ${FirstName}    ${LastName}   ${Email}     ${mobile}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_DomainName}   ${DomainName}
    input text  ${txt_Line1}    ${Line1}
    input text  ${txt_Line2}    ${Line2}
    input text  ${txt_Line3}    ${Line3}
    input text  ${txt_City}     ${City}
    input text  ${txt_State}    ${State}
    input text  ${txt_Country}  ${Country}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
Check the success message for the new tenant
    Wait Until Element Is Visible    ${Success_msg}     timeout=30s
    Element Should Be Visible    ${Success_msg}
    Log    Organization updated successfully. message is visible.
    Wait Until Element Is Visible    ${Tenant_text}    timeout=30


Check the error message pop-up for exist organization
    Wait Until Element Is Visible    ${Error_msg}     timeout=30s
    Element Should Be Visible    ${Error_msg}
    Log    Organization already exist. message is visible.
    sleep   60s

Check the error message for the existing mobile number
    Wait Until Element Is Visible    ${Exist_mobile}     timeout=30s
    Element Should Be Visible    ${Exist_mobile}
    Log    User with mobile +913456466584 already exists message is visible.

Check the error message for the existing email
    Wait Until Element Is Visible    ${Exist_email}     timeout=30s
    Element Should Be Visible    ${Exist_email}
    Log    User with email hanvidh629.vvidh@yopmail.com alrea message is visible

Search with the valid tenant username
    [Arguments]   ${username}
    wait until element is visible   ${Tenat_username}   timeout=10
    input text  ${Tenat_username}   ${username}
    click element   ${btn_Search}

Search with invalid tenant username
     [Arguments]   ${tenantname}
    input text  ${Tenat_username}   ${tenantname}
    click element   ${btn_Search}
    wait until element is visible   ${Invalid_data}

Edit the tenant user details
    sleep   3s
#    wait until element is visible   ${Edit_icon}    timeout=30
    click element   ${Edit_icon}
    click element   ${btn_Edit}
    clear element text  ${Clear_fullname}
    Input Text    ${Clear_fullname}    ManufacturingTwo
    click element   ${btn_Submit}

Check the success message for the updated details
    ${success}=     get text    ${Update_succ_msg}
    Element Should Contain      ${Update_succ_msg}    ${success}
    Should Be Equal     ${success}   Organization updated successfully.
Click on the cancel button
    click element   ${Edit_icon}
    click element   ${btn_Edit}
    click element   ${btn_Cancel}

Validations for the new tenant User
    click element   ${btn_Submit}
    wait until element is visible   ${Fullname_validation}
    wait until element is visible   ${Domainname_validation}
    wait until element is visible   ${About_Teanat_Validation}
    wait until element is visible   ${Firstname_Validation}
    wait until element is visible   ${Lastname_Validation}
    wait until element is visible   ${Mobile_Validation}
    wait until element is visible   ${Email_Validation}
    wait until element is visible   ${Support_Number_Validation}
    wait until element is visible   ${Country_Validation}

Check the fullname validation message
    [Arguments]   ${DomainName}     ${About}    ${FirstName}    ${LastName}     ${Mobile}   ${Email}    ${SupportNum}   ${Dropdown}
    input text  ${txt_DomainName}   ${DomainName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Fullname_validation}

Check the domain name validation message
    [Arguments]   ${FullName}      ${DomainName}    ${About}    ${FirstName}    ${LastName}     ${Mobile}   ${Email}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}

Check the about tenant validation message
    [Arguments]   ${FullName}    ${DomainName}  ${FirstName}    ${LastName}     ${Mobile}   ${Email}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}

Check the firstname validation message
    [Arguments]   ${FullName}      ${DomainName}    ${About}    ${LastName}     ${Mobile}   ${Email}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}

Check the lastname validation message
    [Arguments]   ${FullName}      ${DomainName}    ${About}    ${FirstName}     ${Mobile}   ${Email}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}

Check the mobile validation message
    [Arguments]   ${FullName}      ${DomainName}    ${About}    ${FirstName}    ${LastName}   ${Email}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}

Check the email validation message
    [Arguments]   ${FullName}      ${DomainName}    ${About}    ${FirstName}    ${LastName}     ${Mobile}    ${SupportNum}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Sup_Num}  ${SupportNum}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}

Check the support number validation message
    [Arguments]   ${FullName}      ${DomainName}    ${About}    ${FirstName}    ${LastName}     ${Mobile}   ${Email}   ${Dropdown}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    wait until element is visible   ${txt_Drp}    timeout=30
    Select From List By Label   ${txt_Drp}  ${Dropdown}
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}
Check the country validation message
    [Arguments]   ${FullName}     ${DomainName}   ${About}    ${FirstName}    ${LastName}     ${Mobile}   ${Email}    ${SupportNum}
    input text  ${txt_FullName}   ${FullName}
    input text  ${txt_About}    ${About}
    input text  ${txt_FirstName}    ${FirstName}
    input text  ${txt_LastName}     ${LastName}
    input text  ${txt_Mobile}   ${Mobile}
    input text  ${txt_Email}    ${Email}
    input text  ${txt_Sup_Num}  ${SupportNum}
    click element   ${btn_Submit}
    wait until element is visible   ${Domainname_validation}



***Settings***
Resource         steps_login_page.robot
Suite Setup       Given I Have Access On Optimy Web Application
Suite Teardown    Close Browser


***Keywords***
I Have Access On Optimy Web Application
    Open Optimy Web App  ${optimy_url}

I Input Invalid Email Value
    Input Text    ${email_textbox}    ${invalid_email_input}

I Input valid Email Value
    Input Text    ${email_textbox}    ${valid_email_input}

I Input valid Password Value
    Input Text    ${password_textbox}    ${valid_password_input}

I Click Login Button
    Wait Until Element Is Visible    ${login_button}     ${timeout}
    Click Button                     ${login_button}

I Should See Required Field Validation Message For ${element}
    Set Test Variable  ${element}
    Wait Until Element Is Visible    ${element}     ${timeout}

And ${expected_required_field_message} should Be The Same As ${element_message}
    ${actual_message}    Get Text    ${element}    
    Wait Until Element Is Visible    ${element}    ${timeout}
    Should Be Equal As Strings  ${expected_required_field_message}    ${actual_message}

# Start of test templates
Verify Login Page Validation Message - Empty Fields
    [Arguments]    ${element}    ${element_message}
    When I Click Login Button
    Then I Should See Required Field Validation Message For ${element} 
    And ${expected_required_field_message} should Be The Same As ${element_message}

Verify Login Page Validation Message - Invalid Format
    [Arguments]    ${element}    ${element_message}
    When I Input Invalid Email Value
    And I Click Login Button
    Then I Should See Required Field Validation Message For ${element} 
    And ${expected_invalid_email_format_message} should Be The Same As ${element_message}

Verify Login Page Validation Message - Not Registered Account
    [Arguments]    ${element}    ${element_message}
    When I Input valid Email Value
    And I Input valid Password Value
    And I Click Login Button
    Then I Should See Required Field Validation Message For ${element}
    And ${expected_not_registered_account_message} should Be The Same As ${element_message}



***Test Cases***
Verify Validation Message For Empty Email Field             ${invalid_email_textbox}           ${expected_required_field_message}
    [Template]  Verify Login Page Validation Message - Empty Fields
Verify Validation Message For Empty Password Field          ${invalid_password_textbox}        ${expected_required_field_message}
    [Template]  Verify Login Page Validation Message - Empty Fields
Verify Validation Message For Invalid Email Format          ${invalid_format_email_textbox}    ${expected_invalid_email_format_message}
    [Template]  Verify Login Page Validation Message - Invalid Format
Verify Validation Message For Not Registered Email Format   ${invalid_email_or_password_message}    ${expected_not_registered_account_message}
    [Template]  Verify Login Page Validation Message - Not Registered Account


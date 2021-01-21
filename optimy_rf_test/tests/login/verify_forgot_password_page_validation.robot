***Settings***
Resource         steps_login_page.robot
Suite Setup       Run Keywords    Given I Have Access On Optimy Web Application  AND  Click Lost Password Button
Suite Teardown    Close Browser


***Keywords***
I Have Access On Optimy Web Application
    Open Optimy Web App  ${optimy_url}

Click Lost Password Button
    Wait Until Element Is Visible    ${lost_password_button}     ${timeout}
    Click Element                    ${lost_password_button}
    Wait Until Element Is Visible    ${recover_email_textbox}    ${timeout}

I Input Invalid Email Value
    Input Text    ${recover_email_textbox}    ${invalid_email_input}

I Click Recover Password Button
    Wait Until Element Is Visible    ${recover_password_button}     ${timeout}
    Click Button                     ${recover_password_button}

I Should See Required Field Validation Message For ${element}
    Set Test Variable  ${element}
    Wait Until Element Is Visible    ${element}     ${timeout}

And ${expected_required_field_message} should Be The Same As ${element_message}
    ${actual_message}    Get Text    ${element}    
    Wait Until Element Is Visible    ${element}    ${timeout}
    Should Be Equal As Strings  ${expected_required_field_message}    ${actual_message}

# Start of test templates
Verify Forgot Password Page Validation Message - Empty Fields
    [Arguments]    ${element}    ${element_message}
    When I Click Recover Password Button
    Then I Should See Required Field Validation Message For ${element} 
    And ${expected_required_field_message} should Be The Same As ${element_message}

Verify Forgot Password Page Validation Message - Invalid Format
    [Arguments]    ${element}    ${element_message}
    When I Input Invalid Email Value
    And I Click Recover Password Button
    Then I Should See Required Field Validation Message For ${element} 
    And ${expected_invalid_email_format_message} should Be The Same As ${element_message}



***Test Cases***
Verify Validation Message For Empty Email Field             ${invalid_recover_email_textbox}           ${expected_required_field_message}
    [Template]  Verify Forgot Password Page Validation Message - Empty Fields
Verify Validation Message For Invalid Email Format          ${invalid_format_recover_email_textbox}    ${expected_invalid_email_format_message}
    [Template]  Verify Forgot Password Page Validation Message - Invalid Format

***Settings***
Resource         steps_login_page.robot
Test Template    Verify Lost Password Page
Suite Setup      Run Keywords    Given I Have Access On Optimy Web Application  AND  Click Lost Password Button
Suite Teardown    Close Browser


***Keywords***
Click Lost Password Button
    Wait Until Element Is Visible    ${lost_password_button}     ${timeout}
    Click Element                    ${lost_password_button}
    Wait Until Element Is Visible    ${recover_email_textbox}    ${timeout}

Given I Have Access On Optimy Web Application
    Open Optimy Web App  ${optimy_url}
When I View lost password page
    Wait Until Element Is Visible    ${login_container}     ${timeout}
Then I Should be able to see ${element}
    Wait Until Element Is Visible    ${element}     ${timeout}
Verify Lost Password Page
    [Arguments]    ${element}
    When I View lost password page
    Then I Should be able to see ${element}


***Test Cases***
Verify Logo Is Displayed                   ${optimy_logo}
Verify Email Textbox Is Displayed          ${recover_email_textbox}
Verify Login Button Is Displayed           ${recover_password_button}
Verify Cancel Link Is Displayed            ${recover_cancel_button}
***Settings***
Resource         steps_login_page.robot
Test Template    Verify Login Page
Suite Setup       Given I Have Access On Optimy Web Application
Suite Teardown    Close Browser


***Keywords***
Given I Have Access On Optimy Web Application
    Open Optimy Web App  ${optimy_url}
When I View login page
    Wait Until Element Is Visible    ${login_container}     ${timeout}
Then I Should be able to see ${element}
    Wait Until Element Is Visible    ${element}     ${timeout}
Verify Login Page
    [Arguments]    ${element}
    When I View login page
    Then I Should be able to see ${element}


***Test Cases***
Verify Logo Is Displayed                   ${optimy_logo}
Verify Email Textbox Is Displayed          ${email_textbox}
Verify Password Textbox Is Displayed       ${password_textbox}
Verify Login Button Is Displayed           ${login_button}
Verify Lost Password Link Is Displayed     ${lost_password_button}

***Settings***
Library    Selenium2Library
Library    Dialogs

***Variables***
${optimy_url}         https://login.optimyapp.com/
${login_container}    //div[@class='container']//div[contains(@class,'row mtl')]
${timeout}            15


${valid_email_input}                        test_email@gmail.com
${invalid_email_input}                      invalid_email.com
${valid_password_input}                     test123
${expected_invalid_email_format_message}    Please enter a valid email address (e.g.: john.smith@gmail.com).
${expected_required_field_message}          This field is required.
${expected_not_registered_account_message}          The email address or password is incorrect.



# login page elements
${email_textbox}       (//input[@name='email'])[1]
${password_textbox}    (//input[@name='password'])[1]
${optimy_logo}         //img[@src='/images/logo.png' and @alt='Optimy']
${login_button}        //button[contains(text(),'Login')]
${lost_password_button}        //a[contains(text(),'Lost password')]

#validation message element locations
${invalid_email_textbox}                (//input[@name='email']/..//span[contains(text(),'This field is required')])[1]
${invalid_password_textbox}             (//input[@name='password']/..//span[contains(text(),'This field is required')])[1]
${invalid_format_email_textbox}         (//input[@name='email']/..//span[contains(text(),'Please enter a valid email address (e.g.: john.smith@gmail.com).')])[1]
${invalid_email_or_password_message}    //div[contains(text(),'The email address or password is incorrect.')]

# recover password elements
${recover_email_textbox}                   (//input[@name='email'])[2]
${recover_password_button}                 //button[contains(text(),'Recover my access')]
${recover_cancel_button}                   //a[contains(text(),'cancel')]

#forgot password validation message element locations
${invalid_recover_email_textbox}           (//input[@name='email']/..//span[contains(text(),'This field is required')])[1]
${invalid_format_recover_email_textbox}    (//input[@name='email']/..//span[contains(text(),'Please enter a valid email address (e.g.: john.smith@gmail.com).')])[1]


***Keywords***
Open Optimy Web App
    [Arguments]     ${url}=${optimy_url}    ${browser}=chrome
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${login_container}     ${timeout}
*** Settings ***
Documentation       Common keyword
Library             SeleniumLibrary
Library             OperatingSystem
Variables           ../custom-library/environment.py
#Variables           elements/UserModule.py
#Variables           elements/CommonModule.py
Variables           ../Resources/Elements/Register.py

*** Variables ***
#Admin account
${email}                PAULWYDINC22@MAILINATOR.COM
${password}             !1Qazqaz
# Invalid credentials
${invalid_email}        PAULWYDINC22@MAILINATORCOM
${invalid_password}     !
#Error messages
${invalid_email_msg}    This field must be a valid email.
${emptyfield}           This field is required.
$

*** Keywords ***

Login With Invalid Email
    Input Text                      //*[@id="login-email"]            ${invalid_email}
    input text                      //*[@id="login-password"]         ${password}


Login Admin Account
    Input Text                      //*[@id="login-email"]            ${email}
    input text                      //*[@id="login-password"]         ${password}


Check Error for Invalid Email
    ${invalidEmail}=    Get Text    //*[@id="login-email-invalid-feedback"]


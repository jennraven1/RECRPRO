*** Settings ***
Documentation       Common keyword
Library             SeleniumLibrary
Library             OperatingSystem
Variables           ../custom-library/environment.py
#Variables           elements/UserModule.py
#Variables           elements/CommonModule.py
Variables           ../Resources/Elements/Register.py

*** Variables ***
${BROWSER}              chrome
${BROWSER_MODE}         headless
${ENV}                  sit
${LOGIN_URL}            ${getBaseURL('${ENV}')}/login

${EMAIL}                PAULWYDINC22@MAILINATOR.COM
${PASSWORD}             !1Qazqaz

${RECRUITER_EMAIL}       recruiter10@mailinator.com
${RECRUITER_PASSWORD}             !1Qazqaz
*** Keywords ***
Open Browser In Headless Mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create WebDriver    Chrome    chrome_options=${options}

Begin Web Test
    Run Keyword If      '${BROWSER_MODE}' == 'headless'
    ...     Open Browser In Headless Mode
    ...     ELSE
    ...     Open Browser            about:blank    ${BROWSER}
    Set Window Size         ${1920}    ${1200}

End Web Test
    Close All Browsers

#Login user if not yet
#    ${userIsLoggedIn}=      Run Keyword And Return Status   Element Should Not Be Visible    ${AUTH_USER}
#    Run Keyword If          ${userIsLoggedIn}     Login to home page


#Login to home page
#    Go To                               ${LOGIN_URL}
#    Verify login page is loaded
#    Sleep    1
#    Input Text                          ${EMAIL_FIELD_ELEMENT}       ${EMAIL}
#    Input Text                          ${PASSWORD_FIELD_ELEMENT}    ${PASSWORD}
#    Click Button                        ${LOGIN_BTN_ELEMENT}
#    Wait Until Element Is Visible       ${JOBLIST_WRAPPER_ELEMENT}

Verify Login Page is Loaded
    Wait Until Element Is Visible       //*[@id="login-wrapper"]

Navigate to Login Page
    Open Browser                        ${LOGIN_URL}  ${Browser}

Click Sign In
    Click Button                        Sign In

Verify User Successfully Logged In
    Wait Until Element Is Visible       //*[@id="__nuxt"]

#Verify Register Company Page is loaded
#    Wait Until Element Is Visible       //*[@id="register-wrapper"]

Verify Register Applicant Page is loaded
    Wait Until Element Is Visible       Create a Candidate Account

Navigate to Register Page
    Click Link                          Register now

Login Admin Account
    Input Text                      //*[@id="login-email"]            ${Email}
    input text                      //*[@id="login-password"]         ${Password}

Login Recruiter Account
    Input Text                      //*[@id="login-email"]            ${RECRUITER_EMAIL}
    input text                      //*[@id="login-password"]         ${RECRUITER_PASSWORD}

Tick Stay Signed In
    Click Element                   //*[@id="login-stay-signed-in"]

Click Sign Out
    Click Element                       //*[@class="nav-item dropdown"]
    # See sub-menu Sign Out
    Element Should Be Visible           //*[@class="ni ni-user-run"]
    Click Element                       //*[@class="ni ni-user-run"]
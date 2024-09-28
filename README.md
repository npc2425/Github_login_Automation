GitHub Login Automation
This project automates the process of logging into GitHub using Robot Framework with SeleniumLibrary. It demonstrates how to navigate to the GitHub login page, input credentials, and verify a successful login.



Code Breakdown
*** Settings ***
robot
Copy code
Library           SeleniumLibrary
Suite Setup       Open Browser To GitHub
Suite Teardown    Close All Browsers


Library: This imports the SeleniumLibrary, which provides the necessary keywords for browser automation.
Suite Setup: Before running any tests, it opens the GitHub login page in a browser.
Suite Teardown: After all tests have completed, it closes all browser instances to clean up.


*** Variables ***
robot
Copy code
${BROWSER}        chrome
${GITHUB_URL}     https://github.com/login
${USERNAME}       npc2425
${PASSWORD}       2429@Praveen
${DELAY}          0.5


Variables: These store commonly used values, such as the browser type (Chrome), the URL of the GitHub login page, the username, and password. The delay variable is used to set the speed of actions for better visibility during execution.


*** Test Cases ***
robot
Copy code
Login To GitHub
    Input Username
    Input Password
    Submit Credentials
    Verify Successful Login

    
Test Case: This section defines a single test case called "Login To GitHub". It calls the keywords defined below in order to perform the login actions.


*** Keywords ***
robot
Copy code
Open Browser To GitHub
    Open Browser    ${GITHUB_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    
Open Browser To GitHub: This keyword opens the specified URL in the chosen browser, maximizes the window, and sets the speed for Selenium actions.
robot
Copy code
Input Username
    Wait Until Element Is Visible    id=login_field
    Input Text    id=login_field    ${USERNAME}
Input Username: This waits for the username field to be visible and then inputs the specified username.
robot
Copy code
Input Password
    Wait Until Element Is Visible    id=password
    Input Text    id=password    ${PASSWORD}
Input Password: Similar to the username input, this waits for the password field to be visible and enters the specified password.
robot
Copy code
Submit Credentials
    Click Button    name=commit
Submit Credentials: This keyword simulates a click on the login button to submit the credentials.
robot
Copy code
Verify Successful Login
    Wait Until Page Contains Element    xpath=//summary[@aria-label="View profile and more"]
    Page Should Contain Element    xpath=//summary[@aria-label="View profile and more"]
    Log    Login Successful
Verify Successful Login: This checks for the presence of the profile summary element, indicating a successful login. It logs a message confirming that the login was successful.
How It Works
Setup: The test suite opens a browser and navigates to the GitHub login page.
Input Credentials: It inputs the username and password into the respective fields.
Submit: The test submits the login form.
Verification: It waits for the profile summary element to appear on the page, confirming that the login was successful.
This project is designed to automate the login process for GitHub using Robot Framework and SeleniumLibrary. Here’s a detailed breakdown of the project components and how they work together:

Objective
The primary goal of this project is to log into a GitHub account automatically. By using automation, we can verify that the login functionality works as expected without manual intervention.

Project Components
Robot Framework:

An open-source automation framework for acceptance testing and acceptance test-driven development (ATDD). It uses a keyword-driven approach.
SeleniumLibrary:

A web testing library for Robot Framework that provides keywords to interact with web browsers. It allows us to automate actions like clicking buttons, entering text, and verifying elements on a webpage.
Project Structure
The project is organized into distinct sections:

Settings:

Library: Imports the SeleniumLibrary.
Suite Setup: Opens the browser and navigates to GitHub’s login page before any test runs.
Suite Teardown: Closes all open browsers after tests are complete, ensuring a clean exit.
Variables:

Stores essential values:
${BROWSER}: Specifies the browser to be used (e.g., Chrome).
${GITHUB_URL}: The URL of the GitHub login page.
${USERNAME} and ${PASSWORD}: Credentials for logging into GitHub.
${DELAY}: Controls the speed of execution for visual clarity during the test.
Test Cases:

Defines the main test case, "Login To GitHub," which orchestrates the login process by calling various keywords.
Keywords:

Custom keywords are defined to modularize the actions involved in logging in:
Open Browser To GitHub: Opens the GitHub login page and maximizes the browser window.
Input Username: Waits for the username field to be visible and inputs the provided username.
Input Password: Waits for the password field to appear and enters the provided password.
Submit Credentials: Clicks the login button to submit the form.
Verify Successful Login: Checks for the presence of a specific element that confirms a successful login (the user’s profile summary).
Execution Flow
Setup: The browser is launched, and the GitHub login page is opened.
Username Input: The automation waits for the username field to be ready, then inputs the specified username.
Password Input: Similar to the username, it waits for the password field and enters the password.
Submit Form: The script clicks the login button to submit the credentials.
Verification: After submitting, it checks if the login was successful by looking for a specific element on the resulting page.
Conclusion
This project serves as a practical example of using Robot Framework and SeleniumLibrary for web automation. It highlights the benefits of automation in testing login functionalities, ensuring that the process works correctly with minimal effort. This foundational knowledge can be expanded to test other features and functionalities on web applications.

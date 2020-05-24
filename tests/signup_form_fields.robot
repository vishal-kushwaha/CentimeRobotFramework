*** Settings ***
Library  SeleniumLibrary
Library  PageObjectLibrary
Library    DataDriver    ../resources/test_data_files/signup_fields_data.csv    dialect=excel    encoding=${None}

Resource  ../resources/variables/variables.robot

Suite Setup  Open browser  ${ROOT}  ${BROWSER}
Suite Teardown  Close all browsers

Test Setup  Go to page  AuthenticationPage
Test Template  Invalid email or previously registered email should be rejected on signup form

*** Test Cases ***
Test negative scenarios on signup form  # placeholder test name, actual test names will be pulled from csv file

*** Keywords ***
Invalid email or previously registered email should be rejected on signup form
    [Arguments]    ${email}  ${error}
    Enter email    ${email}
    Click create account button  should_pass=${false}
    Error is displayed on signup form  ${error}
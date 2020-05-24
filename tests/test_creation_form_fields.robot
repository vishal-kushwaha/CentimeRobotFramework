*** Settings ***
Library  SeleniumLibrary
Library  PageObjectLibrary
Library    DataDriver  ../resources/test_data_files/account_creation_fields_data.csv  dialect=excel  encoding=${None}

Resource  ../resources/variables/variables.robot

Suite Setup  Open browser  ${ROOT}  ${BROWSER}
Suite Teardown  Close all browsers

Test Setup  Go to page  AuthenticationPage
Test Template  test field validation

*** Test Case ***
Account creation with required fields  # Placeholder test name, actual test names will be pulled from csv

*** Keywords ***
test field validation
  [Arguments]  ${customer_firstname}  ${customer_lastname}  ${email}  ${password}  ${firstname}  ${lastname}  ${address}  ${city}  ${state}  ${zip}  ${country}  ${mobile}  ${alias}  ${error}
  Enter email    ${email}
  Click create account button
  Enter values in required fields  ${customer_firstname}  ${customer_lastname}  ${email}  ${password}  ${firstname}  ${lastname}  ${address}  ${city}  ${state}  ${zip}  ${country}  ${mobile}  ${alias}
  Click register account button
  run keyword if  '${error}'!='${EMPTY}'  Error is displayed on account creation form
  ...         ELSE  the current page should be  MyAccountPage
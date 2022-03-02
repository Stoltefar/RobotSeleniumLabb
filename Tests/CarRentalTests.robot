*** Settings ***
Documentation  Test cases for assignment in the course 'Automatiserad testning'
...  Testing car rental web page rental11.infotiv.net

Library  SeleniumLibrary
Library  robot.libraries.DateTime

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

Test Setup  Navigate To Infotiv Car Rental Web Page


*** Variables ***
${URL}  http://rental11.infotiv.net/

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    Maximize Browser Window

End Web Test
    Close Browser

Navigate To Infotiv Car Rental Web Page
    Go To  ${URL}
    Wait Until Page Contains  When do you want to make your trip?

Compare Date Value On Page With Current Date
    ${yyyy}  ${mm}  ${dd}=  Get time  year,month,day
    ${dateshown}=  Get Value  id:start
    Should be Equal  ${dateshown}  ${yyyy}-${mm}-${dd}

Choose current date and continue
    Click Element  id:continue
    Wait Until Page Contains  What would you like to drive?

Filter Make Volvo
    Click Element  id:filterMakeHolder
    Click Element  id:ms-opt-4

Filter Two Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-5

Filter Five Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-6

Book First Car In List
    Wait Until Page Contains Element  id:carSelect1
    Click Element  id:carSelect1




*** Test Cases ***
Open Web Page And Verify
    [Documentation]
    [Tags]  Smoke
    Navigate To Infotiv Car Rental Web Page

Check Default Date On Start Page
    [Documentation]  Requirement: On the date selection page[...]. The default values will always be put as todays date.
    [Tags]
    Compare Date Value On Page With Current Date

Choose Date And Continue To Next Page
    [Documentation]  Requirement: If valid dates are inputted, the Continue button will take the user to the car selection page.
    [Tags]
    Choose current date and continue


Check Prompt For Invalid Filter Result
    [Documentation]  Requirement: If no car meets the selected filter criterias, a message asks the user to try a different selection
    [Tags]
    Choose current date and continue
    Filter Make Volvo
    Filter Two Passengers
    Wait Until Page Contains  No cars with selected filters. Please edit filter selection

Check Alert Message For Login When Booking Car
    [Documentation]  Requirement: If the user is not signed in when pressing the book button, an alert box will appear asking the user to sign in before proceeding.
    [Tags]
    Choose current date and continue
    Filter Make Volvo
    Filter Five Passengers
    Book First Car In List
    Alert Should Be Present  You need to be logged in to continue.



*** Settings ***
Documentation  Test cases for assignment in the course 'Automatiserad testning'
...  Testing car rental web page rental11.infotiv.net

Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${URL}  http://rental11.infotiv.net/

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    Maximize Browser Window

End Web Test
    Close Browser

Filter Make Volvo
    Click Element  id:filterMakeHolder
    Click Element  id:ms-opt-4

Filter Two Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-5


*** Test Cases ***
Open Web Page And Verify
    [Documentation]
    [Tags]  Smoke
    Go To  ${URL}
    Wait Until Page Contains  When do you want to make your trip?

Choose Date And Continue To Next Page
    [Documentation]  Requirement: If valid dates are inputted, the Continue button will take the user to the car selection page.
    [Tags]
    # TODO Check default date is displayed.
    Click Element  id:continue
    Wait Until Page Contains  What would you like to drive?

Check Prompt For Invalid Filter Result
    [Documentation]  Requirement: If no car meets the selected filter criterias, a message asks the user to try a different selection
    [Tags]
    Filter Make Volvo
    Filter Two Passengers
    Wait Until Page Contains  No cars with selected filters. Please edit filter selection



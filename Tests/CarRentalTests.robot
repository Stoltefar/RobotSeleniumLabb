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

Verify Page Loaded
    Wait Until Page Contains  When do you want to make your trip?


*** Test Cases ***
Open Web Page And Verify
    [Documentation]
    Go To  ${URL}
    Verify Page Loaded

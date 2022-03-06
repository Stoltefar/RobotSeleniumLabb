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
    Compare Date Value On Page With Current Date
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

Book First Car In Filtered List
    Wait Until Page Contains Element  id:carSelect1
    Click Element  id:carSelect1


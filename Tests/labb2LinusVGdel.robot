*** Settings ***
Documentation  Test case for VG-assignment in the course 'Automatiserad testning'
...  Testing car rental web page rental11.infotiv.net

Resource  ../Resources/keywords.robot

Library  SeleniumLibrary

Suite Setup  Begin Web Test

Test Setup  Navigate To Infotiv Car Rental Web Page

Suite Teardown  End Web Test

*** Variables ***
${URL}  http://rental11.infotiv.net/

*** Test Cases ***



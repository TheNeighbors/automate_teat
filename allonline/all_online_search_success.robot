*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown    Close Browser

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome

*** Test Cases ***
ทดสอบใส่คำค้น ไฟน์ไลน์ ควรเจอ (88 สินค้า)
    ค้นหาและตรวจสอบ    ไฟน์ไลน์    (88 สินค้า)

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผลการค้นหา}
    ใส่คำค้นหา    ${คำค้น}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${ผลการค้นหา}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นหา}
    Wait Until Page Contains    ${ผลการค้นหา}


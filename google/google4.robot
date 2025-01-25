*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown    Close Browser

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

*** Test Cases ***
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    ค้นหาและตรวจสอบ    PIM    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำค้น VS ควรเจอ Visual Studio Code
    ค้นหาและตรวจสอบ    VS    Visual Studio Code

ทดสอบใส่คำค้น poe2 ควรเจอ Path of Exile 2
    ค้นหาและตรวจสอบ    poe2    Path of Exile 2

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


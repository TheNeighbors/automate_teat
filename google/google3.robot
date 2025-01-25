*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

*** Test Cases ***
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา   PIM
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำค้น VS ควรเจอ Visual Studio Code
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา   VS
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   Visual Studio Code

ทดสอบใส่คำค้น PIM ควรเจอ Path of Exile 2
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา   poe2
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา   Path of Exile 2

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นหา}
    Wait Until Page Contains    ${ผลการค้นหา}


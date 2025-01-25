*** Settings ***
Library    SeleniumLibrary

Suite Setup    เปิดเว็บเบราว์เซอร์
Test Setup    เข้า AllOnline
Suite Teardown    Close All Browsers
Test Template    ค้นหาและตรวจสอบ

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome

*** Test Cases ***                                คำค้น   ผลการค้นหา
ทดสอบใส่คำค้น ไฟน์ไลน์ ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    ไฟน์ไลน์    ไฟน์ไลน์ พลัส ผลิตภัณฑ์ซักผ้าชนิดน้ำ (แกลลอน) 3000 มล.    ไฟน์ไลน์ พลัส ผลิตภัณฑ์ซักผ้าชนิดน้ำ (แกลลอน) 3000 มล.

*** Keywords ***
เปิดเว็บเบราว์เซอร์
    Open Browser    browser=${BROWSER}

เข้า AllOnline
    Go To    ${URL}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผลการค้นหา}    ${ผลการค้นหารายการสินค้า}
    ใส่คำค้นหา    ${คำค้น}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${ผลการค้นหา}
    เลือกสินค้า
    ตรวจสอบรายการสินค้า    ${ผลการค้นหารายการสินค้า}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นหา}
    Wait Until Page Contains    ${ผลการค้นหา}

เลือกสินค้า
    Click Element    id=page

ตรวจสอบรายการสินค้า
    [Arguments]    ${ผลการค้นหารายการสินค้า}
    Wait Until Page Contains    ${ผลการค้นหารายการสินค้า}
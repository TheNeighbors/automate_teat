*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=https://www.Google.com    browser=chrome

ใส่คำค้นหา
    Input Text    name=q    PIM

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    Wait Until Page Contains    สถาบันการจัดการปัญญาภิวัฒน์ 
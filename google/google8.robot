*** Settings ***
Suite Setup    เปิดเว็บเบราว์เซอร์
Test Setup    เข้า Google
Suite Teardown    Close All Browsers
Test Template    ค้นหาและตรวจสอบ

Resource   keywords.resource

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

*** Test Cases ***                                คำค้น   ผลการค้นหา
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์
ทดสอบใส่คำค้น VS ควรเจอ Visual Studio Code    VS    Visual Studio Code
ทดสอบใส่คำค้น poe2 ควรเจอ Path of Exile 2    poe2    Path of Exile 2

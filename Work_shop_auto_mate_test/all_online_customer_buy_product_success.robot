*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${BROWSER}   chrome
${DEV_URL}   https://www.allonline.7eleven.co.th/

*** Test Cases ***
ทดสอบการ เลือก สินค้า สั่งซื้อ สินค้า ระบุที่อยู่จัดส่ง และชำระเงินด้วย QR payment สำเร็จ
    เปิดallonline และ login
    ค้นหาสินค้า    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N
    ตรวจสอบผลการค้นหา    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N
    เลือกสินค้า
    ตรวจสอบรายละเอียดสินค้า    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N    ฿ 399   คุณจะได้รับ 117 คะแนน    1
    สั่งซื้อสินค้า
    เลือกและระบุที่อยู่จัดส่ง
    กดดำเนินการชำระเงินและตรวจสอบรายละเอียดการสั่งซื้อ
    เลือก ชำระเงินด้วย QR payment และชำระเงิน



*** Keywords ***
เปิดallonline และ login
    Open Browser    ${DEV_URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    Xpath=//*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Input Text    class=input-email-form    กาญจนา@gmail.com
    Input Text    class=input-password-form    กาญจนา1234
    Click Element    Xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
ค้นหาสินค้า
    [Arguments]    ${คำค้น}    ${ผลการค้นหา}
    Wait Until Element Is Visible    name=q
    Input Text    name=q    ${คำค้น}
    Click Element    class=input-group-btn

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นหา}
    Wait Until Page Contains    ${ผลการค้นหา}

เลือกสินค้า
    Click Element    class=item-list-wrapper
 
ตรวจสอบรายละเอียดสินค้า
    [Arguments]    ${ผลการค้นชื่อสินค้า}    ${ผลการค้นราคา}   ${ผลการค้นพ้อย}   ${ผลการค้นจำนวน}
    Wait Until Element Is Visible    id=title-product
    Element Should Contain    id=title-product    ${ผลการค้นชื่อสินค้า}
    Element Should Contain    class=currentPrice    ${ผลการค้นราคา}
    Element Should Contain    class=isEarned-Burn-allmember    ${ผลการค้นพ้อย}
    Element Attribute Value Should Be    name=order_count    value    ${ผลการค้นจำนวน}

สั่งซื้อสินค้า
    Click Element    Xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[2]/button

เลือกและระบุที่อยู่จัดส่ง
    Click Element    class=tab-address
    Click Element    class=new-address
    Input Text    id=new-address-name    กาญจนา
    Input Text    id=new-address-lastname    มงคล
    Input Text    id=new-address-mobile    0903958789
    Input Text    id=new-address-addrno    56/89
    Input Text    id=new-address-soi    ซ.สามเสน
    Input Text    id=new-address-street    ถ.สามเสน
    Click Element    id=select2-new-address-province-container
    Wait Until Element Is Visible    xpath=//li[contains(text(), 'กรุงเทพมหานคร')]
    Click Element    xpath=//li[contains(text(), 'กรุงเทพมหานคร')]
    Click Element    id=select2-new-address-district-container
    Wait Until Element Is Visible    xpath=//li[contains(text(), 'ดุสิต')]
    Click Element    xpath=//li[contains(text(), 'ดุสิต')]
    Click Element    id=select2-new-address-sub-district-container
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    xpath=//li[contains(text(), 'ดุสิต')]
    Click Element    xpath=//li[contains(text(), 'ดุสิต')]
    Wait Until Element Is Visible    id=gcp-map
    Wait Until Element Is Visible    id=selected-location
    Wait Until Element Is Enabled    id=selected-location
    Sleep    2s
    Click Element    id=selected-location
    Wait Until Element Is Not Visible    id=gcp-map

กดดำเนินการชำระเงินและตรวจสอบรายละเอียดการสั่งซื้อ
    Wait Until Element Is Enabled    id=continue-payment-btn
    Click Element    id=continue-payment-btn
    Element Should Contain    class=invoice-address-wrapper    ชัยวุฒิ อรชร
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[1]/td/div[2]/span    กาญจนา มงคล    เบอร์โทรติดต่อ : 0903958789    56/89 ซ.สามเสน, ถ.สามเสน, ดุสิต ดุสิต กรุงเทพมหานคร 10300
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    CCPets กล่องไม้ กระดาษข่วน รูปปลา SC592N
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]    1
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[4]    ฿ 399
    Element Should Contain    xpath=//*[@id="js-invoice-details-tbody"]/tr[17]/td[2]/b     117

เลือก ชำระเงินด้วย QR payment และชำระเงิน
    Click Element    xpath=//*[@id="payment-options"]/div[4]/button
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Enabled    xpath=//*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button
    Click Element    xpath=//*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button
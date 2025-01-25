*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${DEV_URL}   http://134.209.105.245/product/list
${SIT_URL}   http://159.223.71.75/product/list
${UAT_URL}   http://165.22.255.65/product/list
${BROWSER}   chrome

*** Test Case ***
# ทดสอบซื้อสินค้าและชำระเงินด้วย credit card ของ visa และชำระเงิน สำเร็จ
ทดสอบการค้นหา สินค้า เลือกสินค้า จัดส่งด้วย lineman และชำระเงินด้วย บัตรเครดิต visa สำเร็จ
    ค้นหาสินค้า ด้วยคำค้น    bicycle
    ตรวจสอบผลการค้นหา    Balance Training Bicycle    ฿4,314.60
    เลือกสินค้าใส่ตะกร้า
    ตรวจสอบรายละเอียดสินค้า    Balance Training Bicycle    ฿4,314.60    43
    เพิ่มจำนวนสินค้าที่จะซื้อ
    เพิ่มใส่ ตะกร้า
    ตรวตสอบ สินค้า จำนวน พ้อย และ ราคา ในตะกร้า
    ใส่รายละเอียดจัดส่งสินค้า
    เลือก ประเภทการส่ง lineman ค่าจัดส่งจะต้องเป็น 100
    เลือก ช่องทางชำระเงิน visa
    ตรวจสอบรายละเอียกการสั่งสินค้า
    # กดชำระเงิน

# ทดสอบการค้นหา สินค้า เลือกสินค้า จัดส่งด้วย thaipost และชำระเงินด้วย บัตรเครดิต mastercard สำเร็จ
#     ค้นหาสินค้า ด้วยคำค้น    bicycle
#     ตรวจสอบผลการค้นหา    Balance Training Bicycle    ฿4,314.60
#     เลือกสินค้าใส่ตะกร้า
#     ตรวจสอบรายละเอียดสินค้า    Balance Training Bicycle    ฿4,314.60    43
#     เพิ่มจำนวนสินค้าที่จะซื้อ
#     เพิ่มใส่ ตะกร้า
#     ตรวตสอบ สินค้า จำนวน พ้อย และ ราคา ในตะกร้า
#     ใส่รายละเอียดจัดส่งสินค้า
#     เลือก ประเภทการส่ง lineman ค่าจัดส่งจะต้องเป็น 100
#     เลือก ช่องทางชำระเงิน mastercard
#     ตรวจสอบรายละเอียกการสั่งสินค้า
    # กดชำระเงิน
 

*** Keywords ***
ค้นหาสินค้า ด้วยคำค้น
     [Arguments]    ${คำค้น}
    Open Browser    ${DEV_URL}    ${BROWSER}
    Input Text    name=q    ${คำค้น}
    Click Element    class=input-group-btn

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นชื่อสินค้า}    ${ผลการค้นราคา}
    Wait Until Element Is Visible    id=product-card-1
    Element Should Contain    id=product-card-name-1    ${ผลการค้นชื่อสินค้า}
    Element Should Contain    id=product-card-price-1    ${ผลการค้นราคา}

เลือกสินค้าใส่ตะกร้า
    Click Element   id=product-card-name-1

ตรวจสอบรายละเอียดสินค้า
    [Arguments]    ${ผลการค้นชื่อสินค้า}    ${ผลการค้นราคา}   ${ผลการค้นพ้อย}
    Wait Until Element Is Visible    id=product-detail-product-name
    Element Should Contain    id=product-detail-product-name    ${ผลการค้นชื่อสินค้า}
    Wait Until Element Is Visible    id=product-detail-price-thb
    Element Should Contain    id=product-detail-price-thb    ${ผลการค้นราคา}
    Wait Until Element Is Visible    id=product-detail-point
    Element Should Contain    id=product-detail-point    ${ผลการค้นพ้อย}

เพิ่มจำนวนสินค้าที่จะซื้อ
    Click Element    id=product-detail-quantity-increment-btn
    Element Attribute Value Should Be    id=product-detail-quantity-input    value    2

เพิ่มใส่ ตะกร้า
    Click Element    id=product-detail-add-to-cart-btn
    Wait Until Element Is Visible    id=header-menu-cart-badge
    Element Should Contain    id=header-menu-cart-badge    1

ตรวตสอบ สินค้า จำนวน พ้อย และ ราคา ในตะกร้า
    Click Element    id=header-menu-cart-btn
    Wait Until Element Is Visible    id=order-product-list
    Element Should Contain    id=product-1-name    Balance Training Bicycle
    Clear Element Text    id=product-1-quantity-input
    Input Text    id=product-1-quantity-input    2
    # Click Element    id=order-product-list
    # Wait Until Element Is Visible    id=product-1-point 
    # Element Should Contain    id=product-1-point    86 Points

ใส่รายละเอียดจัดส่งสินค้า
    Click Element    id=shopping-cart-checkout-btn
    Wait Until Element Is Visible    id=product-1-name
    Input Text    id=shipping-form-first-name-input    ชัยวุฒิ
    Input Text    id=shipping-form-last-name-input    อรชร
    Select From List By Label    id=shipping-form-province-select    กรุงเทพมหานคร
    Select From List By Label    id=shipping-form-district-select    เขตบางซื่อ
    Select From List By Label    id=shipping-form-sub-district-select    บางซื่อ
    Element Attribute Value Should Be    id=shipping-form-zipcode-input    value    10800
    Input Text    id=shipping-form-mobile-input    0812345678

เลือก ประเภทการส่ง lineman ค่าจัดส่งจะต้องเป็น 100    
    Click Element    id=shipping-method-3-card
    Wait Until Element Is Visible   id=order-summary-shipping-fee-price
    Element Should Contain    id=order-summary-shipping-fee-price    ฿100.00

เลือก ช่องทางชำระเงิน visa
    Input Text    id=payment-credit-form-fullname-input    ชัยวุฒิ อรชร
    Input Text    id=payment-credit-form-card-number-input    4242424242424242
    Input Text    id=payment-credit-form-expiry-input    18/01
    Input Text    id=payment-credit-form-cvv-input    123

ตรวจสอบรายละเอียกการสั่งสินค้า
    Element Should Contain    id=product-1-name    Balance Training Bicycle
    Element Should Contain    id=product-1-price    ฿8,629.20
    Element Should Contain    id=order-summary-subtotal-price    ฿8,629.19
    Element Should Contain    id=order-summary-receive-point-price    86 Points
    Element Should Contain    id=order-summary-total-payment-price    ฿8,729.19


กดชำระเงิน
    Click Element    id=payment-now-btn
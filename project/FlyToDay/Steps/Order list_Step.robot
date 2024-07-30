*** Settings ***
Resource          ../pages/OrderList_page.robot
*** Keywords ***
Search for the order number in the list of orders
        [Arguments]      ${NumberOrder}
        Search number order    ${NumberOrder}
        Sleep      5

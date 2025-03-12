*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${BOOK_IMAGE}    C:/Users/Administrator/Desktop/Library Test/tests/image_test/the-science-of-science-cover.jpg
${BROWSER}       Chrome
${URL}          http://localhost:3000  
${HOME_PAGE}        ${URL}/home
${REGISTER_PAGE}    ${URL}/register
${LOGIN_PAGE}       ${URL}/login
${DASHBOARD_PAGE}   ${URL}/dashboard
${FORGOT_PASSWORD_PAGE}  ${URL}/forgotPassword
${USER_PAGE}        ${URL}/user



*** Test Cases ***

Register Successful
    Open Browser    ${REGISTER_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=name    Test User
    Input Text    name=usr    testuser123
    Input Text    name=pwd    Pass1234
    Input Text    name=phone    092-222-252622
    Input Text    name=citizencard    1-1111-11111-11-2
    Input Text    name=address    Bangkok BangBuathong
    Click Button    xpath=//button[contains(.,'Sign-up')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-success')]
    Sleep    1s
    Location Should Be    ${LOGIN_PAGE}
    Sleep    1s
    Close Browser

Register Unsuccessful By having username , phone or citizen that already exist
    Open Browser    ${REGISTER_PAGE}    ${BROWSER}
    Maximize Browser Window
    Input Text    name=name    Test AUser
    Input Text    name=usr    testuser
    Input Text    name=pwd    Pass1234
    Input Text    name=phone    092-222-252622
    Input Text    name=citizencard    1-1111-11111-11-2
    Input Text    name=address    Bangkok BangBuathong
    Click Button    xpath=//button[contains(.,'Sign-up')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-danger')]
    Sleep    1s
    Close Browser

Login Successful
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Input Text    name=pwd    Pass1234
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Location Should Be    ${HOME_PAGE}
    Sleep    1s
    Close Browser

Login Unsuccessful
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    Wrongpassword
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-danger')]
    Sleep    1s
    Close Browser

Search Product
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    Pass1234
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    name=search
    Sleep    1s
    Input Text    name=search    PHP
    Sleep    1s
    Wait Until Element Is Visible    name=groupBookId
    Sleep    1s
    Select From List By Value    name=groupBookId    All
    Sleep    1s
    Wait Until Element Is Visible    xpath=//button[@type='submit']
    Sleep    1s
    Click Button    xpath=//button[@type='submit']
    Sleep    1s
    Wait Until Page Contains    PHP
    Sleep    1s
    Close Browser


Borrow Book Function
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    Pass1234
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/borrow/')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/borrow/')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Borrow Book')]
    Sleep    1s
    Wait Until Element Is Visible    name=duration
    Sleep    1s
    Select From List By Value    name=duration    7
    Sleep    1s
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'Borrow')]
    Sleep    1s
    Click Button    xpath=//button[contains(text(), 'Borrow')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-success')]
    Sleep    1s
    Close Browser

Set All Books to Available
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    admin
    Sleep    1s
    Input Text    name=pwd    1
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Location Is    ${HOME_PAGE}
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Click Element    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/book')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/book')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/setAllBookAvailable')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/setAllBookAvailable')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table-hover')]/tbody/tr
    Sleep    1s
    ${book_count} =    Get Element Count    xpath=//table[contains(@class, 'table-hover')]/tbody/tr
    Sleep    1s
    ${available_count} =    Get Element Count    xpath=//table[contains(@class, 'table-hover')]/tbody/tr/td[contains(text(), 'Available')]
    Sleep    1s
    Should Be True    ${book_count} == ${available_count}
    Sleep    1s
    Close Browser



Admin Add User 
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    admin
    Sleep    1s
    Input Text    name=pwd    1
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Location Is    ${HOME_PAGE}
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Click Element    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/user')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/user')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/addUser')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/addUser')]
    Sleep    1s
    Wait Until Element Is Visible    name=name
    Sleep    1s
    Input Text    name=name    New UserAdd
    Input Text    name=usr    newuserADD123
    Input Text    name=pwd    AddPass123
    Input Text    name=phone    091-234-5678
    Input Text    name=citizencard    1-2345-67890-12-1
    Select Radio Button    level    user
    Sleep    1s
    Click Button    xpath=//button[contains(text(), 'Save')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Location Is    ${USER_PAGE}
    Sleep    1s
    Wait Until Page Contains    newuserADD123
    Sleep    1s
    Close Browser

Admin Add Then Delete User After
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    admin
    Sleep    1s
    Input Text    name=pwd    1
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Location Is    ${HOME_PAGE}
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Click Element    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/user')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/user')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/addUser')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/addUser')]
    Sleep    1s
    Wait Until Element Is Visible    name=name
    Sleep    1s
    Input Text    name=name    New UserDelete
    Input Text    name=usr    newuserDELETE123
    Input Text    name=pwd    DeletePass123
    Input Text    name=phone    091-234-5673
    Input Text    name=citizencard    1-2345-67890-12-4
    Select Radio Button    level    user
    Sleep    1s
    Click Button    xpath=//button[contains(text(), 'Save')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Location Is    ${USER_PAGE}
    Sleep    1s
    Wait Until Page Contains    newuserDELETE123
    Sleep    1s
    Wait Until Element Is Visible    xpath=//tr[td[contains(text(), 'New User')]]//a[contains(@href, '/deleteUser')]
    Sleep    1s
    Click Element    xpath=//tr[td[contains(text(), 'New User')]]//a[contains(@href, '/deleteUser')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Location Is    ${USER_PAGE}
    Sleep    1s
    Page Should Not Contain    New UserDelete
    Sleep    1s
    Close Browser
*** Test Cases ***
Add Book to Cart
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    Pass1234
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//form[input[@name='bookId'][@value='43']]/button[@type='submit']
    Sleep    1s
    Click Button    xpath=//form[input[@name='bookId'][@value='43']]/button[@type='submit']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/cart')]/span[contains(@class, 'badge')]
    Sleep    1s
    ${cart_count}=    Get Text    xpath=//a[contains(@href, '/cart')]/span[contains(@class, 'badge')]
    Sleep    1s
    Should Be True    ${cart_count} >= 1
    Sleep    1s
    Close Browser


Update User Profile
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=usr
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Wait Until Element Is Visible    name=pwd
    Sleep    1s
    Input Text    name=pwd    Pass1234
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[@id='navbarScrollingDropdown']
    Sleep    1s
    Click Element    xpath=//a[@id='navbarScrollingDropdown']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/profile')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/profile')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/editProfile')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/editProfile')]
    Sleep    1s
    Wait Until Element Is Visible    name=name
    Input Text    name=name    Test UserUpdateda
    Input Text    name=address    Bangkok
    Click Button    xpath=//button[contains(.,'Save')]
    Sleep    1s
    Handle Alert     ACCEPT
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-success')]
    Close Browser







Remove Item from Cart and Verify
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    Pass1234
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//form[input[@name='bookId'][@value='43']]/button[@type='submit']
    Sleep    1s
    Click Button    xpath=//form[input[@name='bookId'][@value='43']]/button[@type='submit']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/cart')]/span[contains(@class, 'badge')]
    Sleep    1s
    ${cart_count}=    Get Text    xpath=//a[contains(@href, '/cart')]/span[contains(@class, 'badge')]
    Sleep    1s
    Should Be True    ${cart_count} >= 1
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/cart')]/span[contains(@class, 'badge')]
    Sleep    1s
    ${cart_count}=    Get Text    xpath=//a[contains(@href, '/cart')]/span[contains(@class, 'badge')]
    Sleep    1s
    Run Keyword If    ${cart_count} >= 1    Click Element    xpath=//a[contains(@href, '/cart')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table-hover')]/tbody/tr
    Sleep    1s
    ${initial_items}=    Get Element Count    xpath=//table[contains(@class, 'table-hover')]/tbody/tr
    Sleep    1s
    Click Button    xpath=//table[contains(@class, 'table-hover')]/tbody/tr[1]//button[contains(text(), 'Remove')]
    Sleep    1s
    Wait Until Element Is Not Visible    xpath=//table[contains(@class, 'table-hover')]/tbody/tr[1]
    Sleep    1s
    ${remaining_items}=    Get Element Count    xpath=//table[contains(@class, 'table-hover')]/tbody/tr
    Sleep    1s
    Should Be True    ${remaining_items} == ${initial_items} - 1
    Sleep    1s
    Close Browser

Delete Book with Image Upload
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    admin
    Sleep    1s
    Input Text    name=pwd    1
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Location Is    ${HOME_PAGE}
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Click Element    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/book')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/book')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/addBook')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/addBook')]
    Sleep    1s
    Input Text    name=book_name    SCIENCE
    Input Text    name=isbn    978123
    Input Text    name=author    Test Author
    Input Text    name=detail    Test automation
    Input Text    name=price    50
    Input Text    name=stock    10
    Choose File    name=img    ${BOOK_IMAGE}
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Save')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[@id='messageModal']//div[contains(@class, 'alert-success')]    
    Page Should Contain Element    xpath=//div[@id='messageModal']//div[contains(text(), 'Success')]
    Click Button    xpath=//div[@id='messageModal']//button[contains(text(), 'Close')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//tr[td[contains(text(), 'SCIENCE')]]//a[contains(@href, '/deleteBook')]
    Sleep    1s
    Click Element    xpath=//tr[td[contains(text(), 'SCIENCE')]]//a[contains(@href, '/deleteBook')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Location Is    ${URL}/book
    Sleep    1s
    Close Browser


*** Test Cases ***
Add Book with Image Upload
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    admin
    Sleep    1s
    Input Text    name=pwd    1
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Location Is    ${HOME_PAGE}
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Click Element    xpath=//a[@id='navbarDropdownAdmin']
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/book')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/book')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/addBook')]
    Sleep    1s
    Click Element    xpath=//a[contains(@href, '/addBook')]
    Sleep    1s
    Input Text    name=book_name    SCIENCE
    Input Text    name=isbn    978123
    Input Text    name=author    Test Author
    Input Text    name=detail    Test automation
    Input Text    name=price    50
    Input Text    name=stock    10
    Choose File    name=img    ${BOOK_IMAGE}
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Save')]
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[@id='messageModal']//div[contains(@class, 'alert-success')]    
    Page Should Contain Element    xpath=//div[@id='messageModal']//div[contains(text(), 'Success')]
    Close Browser






Forgot Password Flow
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    Forgotpassword
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-danger')]
    Sleep    1s
    Go To    ${FORGOT_PASSWORD_PAGE}
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Submit')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Password Reset Link')]
    Sleep    1s
    ${reset_link}=    Get Element Attribute    xpath=//a[contains(text(), 'Password Reset Link')]    href
    Sleep    1s
    Go To    ${reset_link}
    Sleep    1s
    Input Text    name=pwd    NewPass123
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Submit')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-success')]
    Sleep    1s
    Go To    ${LOGIN_PAGE}
    Sleep    1s
    Input Text    name=usr    testuser123
    Sleep    1s
    Input Text    name=pwd    NewPass123
    Sleep    1s
    Click Button    xpath=//button[contains(.,'Log-in')]
    Sleep    1s
    Location Should Be    ${HOME_PAGE}
    Sleep    1s
    Close Browser
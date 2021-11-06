--1--
SELECT COUNT(*) FROM user_account;

A.15

--2--
SELECT fName
FROM user_account
WHERE birthDate >= "2000-01-01";

A. Yoshiki, Kana, Rio

--3--
SELECT count(*)
FROM order_detail
WHERE total_price >= 100;

A. 4

--4--
SELECT item_name
FROM company
JOIN item on fk_companyID = companyID
WHERE company_name = "HosecenterA"



--5--

SELECT item_name
FROM user_account
JOIN user_order on fk_userID = userID
JOIN order_detail on fk_orderID = orderID
JOIN item on itemID = order_detail.fk_itemID
WHERE ship_to_date BETWEEN "2018-01-01" AND "2020-12-31"


--6--

SELECT COUNT(*)
FROM user_account
JOIN user_order on fk_userID = userID
JOIN order_detail on fk_orderID = orderID
WHERE ship_to_date >= "2021-01-01"



--7--
SELECT fName, total_price
FROM user_account
JOIN user_order on fk_userID = userID
JOIN order_detail on fk_orderID = orderID
WHERE total_price >= 50;




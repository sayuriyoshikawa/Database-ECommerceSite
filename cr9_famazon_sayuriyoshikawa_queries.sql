--1--
SELECT fName
FROM user_account
WHERE birthDate >= "2000-01-01";


--2--
SELECT count(*)
FROM order_detail
WHERE total_price >= 100;


--3--
SELECT item_name
FROM company
JOIN item on fk_companyID = companyID
WHERE company_name = "HosecenterA"



--4--
SELECT email
FROM user_account
JOIN adress on adressID = user_account.fk_adressID
JOIN country on countryID = adress.fk_countryID
WHERE country_name = "Austria";



--5--
SELECT fName, total_price
FROM user_account
JOIN user_order on fk_userID = userID
JOIN order_detail on fk_orderID = orderID
WHERE total_price >= 50;



--6--
SELECT COUNT(*)
FROM user_account
JOIN user_order on fk_userID = userID
JOIN order_detail on fk_orderID = orderID
WHERE ship_to_date >= "2021-01-01"



--7--
SELECT item_name
FROM user_account
JOIN user_order on fk_userID = userID
JOIN order_detail on fk_orderID = orderID
JOIN item on itemID = order_detail.fk_itemID
WHERE ship_to_date BETWEEN "2018-01-01" AND "2020-12-31"


--8--
SELECT item_name, ship_from_date, country_name
FROM user_account
JOIN adress on adressID = user_account.fk_adressID
JOIN country on countryID = adress.fk_countryID
JOIN user_order on user_order.fk_userID = user_account.userID 
JOIN order_detail on order_detail.fk_orderID = user_order.orderID
JOIN item on itemID = order_detail.fk_itemID
WHERE country_name = "Austria";

--9--
SELECT item_name, method
FROM user_account
JOIN payment on payment.fk_userID = user_account.userID
JOIN payment_method on payment_methodID = payment.fk_payment_methodID
JOIN user_order on user_order.fk_userID = user_account.userID 
JOIN order_detail on order_detail.fk_orderID = user_order.orderID
JOIN item on itemID = order_detail.fk_itemID
WHERE method = "credit card";


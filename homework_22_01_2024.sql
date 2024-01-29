Task #1
Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)

SELECT OrderDetails.OrderID as order_number,
SUM(Products.Price * OrderDetails.Quantity) as order_price
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDetails.OrderID
HAVING order_price >= 5000

Task #2
Вывести страны, в которые было отправлено 3 и более заказов

SELECT DISTINCT Customers.Country,
COUNT(Orders.OrderID) as count_of_orders
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Country
HAVING count_of_orders >= 3

Task #3
Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)

SELECT OrderDetails.ProductID,
COUNT(OrderDetails.ProductID * OrderDetails.Quantity) as top_10_popular_sold_products
FROM OrderDetails
GROUP BY OrderDetails.ProductID
ORDER BY top_10_popular_sold_products DESC
LIMIT 10

Task #4
Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)

SELECT Employees.LastName, Employees.FirstName,
SUM(Products.Price * OrderDetails.Quantity) * .05 AS manager_salary
FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Employees.EmployeeID

Task #5
Дополните схему БД "онлайн-шахматы" функционалом групповых чатов

https://dbdiagram.io/d/CHESS-GAME-CHATS-65b835f1ac844320aefca512
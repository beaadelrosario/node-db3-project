-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT product.ProductName, category.CategoryName 
from Product
JOIN Category on product.CategoryId = category.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [order].Id, [order].ShipName
from [order]
WHERE [order].OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Product.ProductName, OrderDetail.Quantity
from OrderDetail
JOIN Product on Product.Id = OrderDetail.ProductId
WHERE OrderDetail.OrderId = 10251
order by Product.ProductName asc;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [Order].Id, [Order].CustomerId, Customer.CompanyName, Employee.LastName
from [Order]
JOIN Customer on [Order].CustomerId = Customer.Id
JOIN Employee on [Order].EmployeeId = Employee.Id;
/*using database */
use AdventureWorks2008R2;

/*Write separate queries using a join, a subquery, a CTE, and then an EXISTS to list all AdventureWorks customers who have not placed 
an order*/

/* 1. By using joins */
Select Pers.FirstName + Pers.LastName as CustomerName from Person.Person Pers Inner Join 
	Sales.Customer SC ON Pers.BusinessEntityID = SC.CustomerID Left Join
	Sales.SalesOrderHeader SH on SC.CustomerID = SH.CustomerID
where SH.SalesOrderID IS NULL;

/* 2. By Using SubQuery */
select FirstName + LastName as CustomerName from Person.Person
	where BusinessEntityID in 
		(Select CustomerID from Sales.Customer where CustomerID not in 
			(Select CustomerID from Sales.SalesOrderHeader));

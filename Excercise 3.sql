/*using database */
use AdventureWorks2008R2;

/*Show the most recent five orders that were purchased from account numbers that have spent more than $70,000 with 
AdventureWorks.*/

Select Top 5 SalesOrderID, OrderDate, AccountNumber, Sum(TotalDue) as MoneySpent from Sales.SalesOrderHeader
	Group by AccountNumber, OrderDate, SalesOrderID
	having Sum(TotalDue) > 70000
order by OrderDate DESC;
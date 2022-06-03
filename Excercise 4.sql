/*using database */
use AdventureWorks2008R2;

/*Create a function that takes as inputs a SalesOrderID, a Currency Code, and a date, and returns a table of all the SalesOrderDetail rows 
for that Sales Order including Quantity, ProductID, UnitPrice, and the unit price converted to the target currency based on the end of 
day rate for the date provided. Exchange rates can be found in the Sales.CurrencyRate table. (Use AdventureWorks */
Go
Create function New2Function (@SalesOrderID int, @CurrencyCode nvarchar(3), @Date datetime)
	returns table as 
	return ( Select SD.ProductID, SD.OrderQty, SD.UnitPrice, SD.UnitPrice * SR.EndOFDayRate as 'TargetPrice'
		from Sales.SalesOrderDetail as SD, Sales.CurrencyRate as SR
		where SR.ToCurrencyCode = @CurrencyCode and SR.ModifiedDate = @Date and SD.SalesOrderID = @SalesOrderID )


Go 
Select * from New2Function(43665, 'ARS', '2005-07-01');

drop Function New2Function;
/*using database */
use AdventureWorks2008R2;

/* Display the number of records in the [SalesPerson] table. (Schema(s) involved: Sales) */
select COUNT(*)  as totalNumberOfRecords from Sales.SalesPerson;

/*Select both the FirstName and LastName of records from the Person table where the FirstName begins with the letter ‘B’. 
(Schema(s) involved: Person)*/
Select FirstName, LastName from Person.Person where FirstName like 'b%';

/*Select a list of FirstName and LastName for employees where Title is one of Design Engineer, Tool Designer or Marketing 
Assistant. (Schema(s) involved: HumanResources, Person*/
Select 
	(select FirstName from Person.Person where e.BusinessEntityID = BusinessEntityID) as FirstName,
	(select LastName from Person.Person where e.BusinessEntityID = BusinessEntityID) as LastName 
from HumanResources.Employee e where JobTitle in ('Design Engineer', 'Tool Designer', 'Marketing Assistant');

/*Display the Name and Color of the Product with the maximum weight. (Schema(s) involved: Production*/
select Name, Color from Production.Product where Weight = (select MAX(Weight) from Production.Product);

/*Display Description and MaxQty fields from the SpecialOffer table. Some of the MaxQty values are NULL, in this case display 
the value 0.00 instead. (Schema(s) involved: Sales*/
select Description, ISNULL(MaxQty, 0.00) as MaxQuantity from Sales.SpecialOffer;

/*Display the overall Average of the [CurrencyRate].[AverageRate] values for the exchange rate ‘USD’ to ‘GBP’ for the year 2005 
i.e. FromCurrencyCode = ‘USD’ and ToCurrencyCode = ‘GBP’. Note: The field [CurrencyRate].[AverageRate] is defined as 
'Average exchange rate for the day.' (Schema(s) involved: Sales)*/
select AVG(Averagerate) as AvgRate from Sales.CurrencyRate where FromCurrencyCode = 'USD' AND ToCurrencyCode = 'GBP';

/*Display the FirstName and LastName of records from the Person table where FirstName contains the letters ‘ss’. Display an 
additional column with sequential numbers for each row returned beginning at integer 1. (Schema(s) involved: Person)*/
Select ROW_NUMBER() OVER(Order by FirstName) as Sequence_number, FirstName, LastName from Person.Person where FirstName like '%ss%';

/*Sales people receive various commission rates that belong to 1 of 4 bands. (Schema(s) involved: Sales
CommissionPct Commission Band
0.00			Band 0
Up To 1%		Band 1
Up To 1.5%		Band 2
Greater 1.5%	Band 3 Display the [SalesPersonID] with an additional column entitled ‘Commission Band’ indicating the appropriate band as above */select BusinessEntityID as SalesPersonID,	Case 		when CommissionPct = 0.00 then 'BAND 0'		when CommissionPct > 0.00 AND CommissionPct <= 0.01 Then 'BAND 1'		when CommissionPct > 0.01 AND CommissionPct <= 0.015 then 'BAND 2'		when CommissionPct > 0.015 then 'BAND 3'	end as CommissionBandfrom Sales.SalesPerson;/*Display the managerial hierarchy from Ruth Ellerbrock (person type – EM) up to CEO Ken Sanchez. Hint: use 
[uspGetEmployeeManagers] (Schema(s) involved: [Person], [HumanResources]) */declare @id intselect @id = BusinessEntityID from Person.Person where FirstName = 'Ruth' AND LastName = 'Ellerbrock' AND PersonType = 'EM';exec uspGetEmployeeManagers @BusinessEntityID = @id;/*Display the ProductId of the product with the largest stock level. Hint: Use the Scalar-valued function [dbo]. [UfnGetStock]. 
(Schema(s) involved: Production)*/select ProductID from Production.Product where SafetyStockLevel = (select MAX(SafetyStockLevel) from Production.Product);
/*using database */
use AdventureWorks2008R2;

/* Display the number of records in the [SalesPerson] table. (Schema(s) involved: Sales) */
select COUNT(*)  as totalNumberOfRecords from Sales.SalesPerson;

/*Select both the FirstName and LastName of records from the Person table where the FirstName begins with the letter �B�. 
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

/*Display the overall Average of the [CurrencyRate].[AverageRate] values for the exchange rate �USD� to �GBP� for the year 2005 
i.e. FromCurrencyCode = �USD� and ToCurrencyCode = �GBP�. Note: The field [CurrencyRate].[AverageRate] is defined as 
'Average exchange rate for the day.' (Schema(s) involved: Sales)*/
select AVG(Averagerate) as AvgRate from Sales.CurrencyRate where FromCurrencyCode = 'USD' AND ToCurrencyCode = 'GBP';

/*Display the FirstName and LastName of records from the Person table where FirstName contains the letters �ss�. Display an 
additional column with sequential numbers for each row returned beginning at integer 1. (Schema(s) involved: Person)*/
Select ROW_NUMBER() OVER(Order by FirstName) as Sequence_number, FirstName, LastName from Person.Person where FirstName like '%ss%';

/*Sales people receive various commission rates that belong to 1 of 4 bands. (Schema(s) involved: Sales
CommissionPct Commission Band
0.00			Band 0
Up To 1%		Band 1
Up To 1.5%		Band 2
Greater 1.5%	Band 3 
[uspGetEmployeeManagers] (Schema(s) involved: [Person], [HumanResources]) */
(Schema(s) involved: Production)*/
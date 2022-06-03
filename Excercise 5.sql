/*using database */
use AdventureWorks2008R2;

/*Write a Procedure supplying name information from the Person.Person table and accepting a filter for the first name. Alter the above 
Store Procedure to supply Default Values if user does not enter any value. ( Use AdventureWorks */

Go 
Create Procedure SupplyingNameInfoFromPerson @FirstName nvarchar(20) = 'Sam' 
	as begin
	Select BusinessEntityID, CONCAT(FirstName, LastName) as 'NAME', PersonType
		from Person.Person where FirstName = @FirstName
End

Go
execute SupplyingNameInfoFromPerson @FirstName = 'Zoe';

drop procedure SupplyingNameInfoFromPerson;


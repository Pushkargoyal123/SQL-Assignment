/*using database */
use AdventureWorks2008R2;

/* Write a trigger for the Product table to ensure the list price can never be raised more than 15 Percent in a single change. Modify the 
above trigger to execute its check code only if the ListPrice column is updated (Use AdventureWorks Database) */

Go 
Create or alter Trigger [Production].[trgLimitPriceChanges] on [Production].[Product]
	for update as
	if Exists 
		( Select * from inserted I Join deleted D on I.ProductID = D.ProductID
		 where I.ListPrice > (D.ListPrice * 1.15)
		)
	Begin 
	RAISERROR( 'Price increase may not be greater than 15 percent . Transaction Failed. ', 16, 1);
	RollBack TRAN
end

Go 
Select * from Production.Product where ProductID = 706

update Production.Product set ListPrice = 2395.0475 where ProductID = 706;
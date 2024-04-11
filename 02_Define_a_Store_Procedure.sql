ALTER PROCEDURE dbo.fetchCarrierDetails
 @StoreName varchar(50),
 @TrackingNumber1 varchar(300) OUTPUT
AS
BEGIN
	DECLARE @salesOrderID int;
	DECLARE @trackingNumber varchar;

    SET NOCOUNT ON;
    PRINT 'Display Carrier Information Here' ;
    
	SELECT TOP 1 @salesOrderID = SOH.SalesOrderID 
		FROM Sales.SalesOrderHeader SOH
	    Inner Join Sales.Customer C on SOH.CustomerID = C.CustomerID
		Inner Join Sales.Store S on C.StoreID = S.BusinessEntityID
		WHERE S.Name =@StoreName
										ORDER BY SOH.OrderDate DESC
	if @@ROWCOUNT > 0 
		BEGIN
			SELECT TOP 1 @TrackingNumber1 = SOD.CarrierTrackingNumber
				FROM Sales.SalesOrderDetail SOD
				WHERE SOD.SalesOrderID = @salesOrderID and SOD.CarrierTrackingNumber is not Null;

				PRINT 'Tracking Number' + @TrackingNumber1;
		END
	ELSE 
		SET @TrackingNumber1 = 'Store Not Found';
	END

DECLARE @Trackinfo varchar(300);
SET @Trackinfo = Null;
EXEC dbo.fetchCarrierDetails 'Good Toys',@Trackinfo OUTPUT;
SELECT @Trackinfo
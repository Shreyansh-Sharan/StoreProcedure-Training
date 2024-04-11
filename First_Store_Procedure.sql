CREATE PROCEDURE dbo.uspCalculateTime
    -- Add the parameters for the store procedure here
    @distance float,
    @velocity float
AS
BEGIN
     -- SET NOCOUNT ON added to prevent extra result sets from 
     -- Interfering with SELECT Statement
    SET NOCOUNT ON;

     --INSERT STATEMENT FOR PROCEDURE HERE
    IF (@velocity <> 0.00)
        SELECT @distance/@velocity
    ELSE
        SELECT 0.00;

END
CREATE PROCEDURE dbo.uspAddNumbers
    @num1 float, @num2 float
    AS
BEGIN
    SET NOCOUNT ON;
    IF (@num1<>0 AND @num2 <>0)
        SELECT @num1 + @num2;
    ELSE 
        SELECT 0;
END;

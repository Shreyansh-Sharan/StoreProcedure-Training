-- You should be able to create a store procedure - 
-- When a store procedure is created
-- To identify its major parts
-- To execute a store procedure using parametes and return values.

-- BUSINESS SCENARIO
    -- The developer's need a way to provide a customer with latest tracking information
    -- We will create a store procedure that accepts the customer need as imput 
    -- Returns the latest tracking information

-- Parts of Store Procedure
    -- PARAMETERS
        -- Store procedure can accept parametrs values as inputs
        -- Modified values can be passes back to the calling program
    -- Execution
        -- Stored procedure can execute SQL statement, utilize conditional logic suc as IF THEN or CASE
           --statement and looping constructs to perform tasks
        -- A store procedure is able to call other stored procedure
    
    -- Output
        -- Can return a single value such as number or text value
        -- sets or rows as a result set
        -- OUTPUT PARAMETERS


--EXAMPLE
CREATE PROCEDURE HR.uspFindEmployee
    @BusinessEntityID Int
AS 
BEGIN
    SET NOCOUNT ON;
    SELECT BusinessEntityID, 
           NationalIDNumber,
           LoginID,
           JobTitle,
           HireDate
    FROM HumanResources.Employee
    WHERE BusinessEntityID = @BusinessEntityID;
END
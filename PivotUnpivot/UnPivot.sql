USE AdventureWorks2019
GO


----- Only NO shows column will be Unpivoted

SELECT ProductID, StartOrEndDate, Dates, StandardCost  
FROM
(
  SELECT 
         ProductID   ----this column shows in main(external) Select
        ,StartDate   ----this column NO shows in main(external) Select
        ,EndDate     ----this column NO shows in main(external) Select
  	    ,StandardCost  ----this column shows in main(external) Select
    FROM [AdventureWorks2019].[Production].[ProductCostHistory]
	) p  
UNPIVOT  
   (Dates FOR StartOrEndDate IN   
      (StartDate, EndDate)  
)AS unpvt;



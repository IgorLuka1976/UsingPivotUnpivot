USE AdventureWorks2019
GO

------Task: How many JobTitles in each Department

SELECT 
	 [JobTitle]
	,[Engineering]
	,[Tool Design]
	,[Sales]
	,[Marketing]
	,[Purchasing]
	,[Research and Development]
	,[Production]
	,[Production Control]
	,[Human Resources]
	,[Finance]
	,[Information Services]
	,[Document Control]
	,[Quality Assurance]
	,[Facilities and Maintenance]
	,[Shipping and Receiving]
	,[Executive]
FROM
(
SELECT 
    e.LoginID
   ,e.JobTitle
   ,d.Name AS DepartmentName
FROM HumanResources.Employee e
INNER JOIN HumanResources.EmployeeDepartmentHistory ed ON ed.BusinessEntityID=e.BusinessEntityID
INNER JOIN HumanResources.Department d ON d.DepartmentID=ed.DepartmentID
) p  
PIVOT  
(  
COUNT (LoginID)  
FOR DepartmentName IN  
(
	 [Engineering]
	,[Tool Design]
	,[Sales]
	,[Marketing]
	,[Purchasing]
	,[Research and Development]
	,[Production]
	,[Production Control]
	,[Human Resources]
	,[Finance]
	,[Information Services]
	,[Document Control]
	,[Quality Assurance]
	,[Facilities and Maintenance]
	,[Shipping and Receiving]
	,[Executive]
)  
) AS pvt  



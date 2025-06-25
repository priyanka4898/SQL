CREATE TABLE blinkit_data
(
Item_Fat_Content	VARCHAR(50),
Item_Identifier	VARCHAR(50),
Item_Type	VARCHAR(50),
Outlet_Establishment_Year	INT,
Outlet_Identifier	VARCHAR(50),
Outlet_Location_Type	VARCHAR(50),
Outlet_Size	 VARCHAR(50),
Outlet_Type	VARCHAR(50),
Item_Visibility	FLOAT,
Item_Weight	FLOAT NULL,
Total_Sales	FLOAT,
Rating FLOAT

);

SELECT * FROM blinkit_data;

SELECT COUNT(*) FROM blinkit_data;

SELECT DISTINCT (Item_Fat_Content) FROM blinkit_data;

UPDATE blinkit_data
SET Item_Fat_Content =
CASE
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content ='reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT CAST (SUM(Total_Sales) / 1000000 AS DECIMAL(10,2)) AS Total_Sales_Million 
FROM blinkit_data;

SELECT CAST (AVG( Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales
FROM blinkit_data
WHERE Outlet_Establishment_Year= 2022;


SELECT COUNT(*) AS NO_Of_Items 
FROM blinkit_data
WHERE Outlet_Establishment_Year= 2022;

 SELECT CAST (SUM(Total_Sales) / 1000000 AS DECIMAL(10,2)) AS Total_Sales_Million 
FROM blinkit_data
WHERE Item_Fat_Content= 'Low Fat';

SELECT CAST (SUM(Total_Sales) / 1000000 AS DECIMAL(10,2)) AS Total_Sales_Million 
FROM blinkit_data
WHERE Outlet_Establishment_Year= 2022;

SELECT CAST (AVG( Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data;


 SELECT Item_Fat_Content,
 						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales_Thousand,
 						CAST (AVG( Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						 COUNT(*) AS NO_Of_Items ,
						 CAST (AVG( Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_Thousand DESC;

SELECT Item_Type,
						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales,
 						CAST (AVG( Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						 COUNT(*) AS NO_Of_Items ,
						 CAST (AVG( Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC
LIMIT 5;
 
SELECT Outlet_Location_Type,Item_Fat_Content,
						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales
 					
FROM blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content
ORDER BY Total_Sales ;
 
SELECT 
    Outlet_Location_Type,
    CAST (SUM(CASE WHEN Item_Fat_Content = 'Low Fat' THEN Total_Sales END) AS DECIMAL(10,2)) AS Low_Fat,
    CAST(SUM(CASE WHEN Item_Fat_Content = 'Regular' THEN Total_Sales END)AS DECIMAL(10,2)) AS Regular
FROM 
    blinkit_data
GROUP BY 
    Outlet_Location_Type
ORDER BY 
    Outlet_Location_Type;

SELECT Outlet_Establishment_Year,
						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales			
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ;

SELECT Outlet_Establishment_Year,
 						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales,
 						CAST (AVG( Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						 COUNT(*) AS NO_Of_Items ,
						 CAST (AVG( Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC;


SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


SELECT Outlet_Location_Type,
 						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales,
						 CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
 						CAST (AVG( Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						 COUNT(*) AS NO_Of_Items ,
						 CAST (AVG( Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year= 2020
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;


SELECT Outlet_Type,
 						CAST( SUM(Total_Sales) AS DECIMAL(10,2) )AS Total_Sales,
						 CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
 						CAST (AVG( Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						 COUNT(*) AS NO_Of_Items ,
						 CAST (AVG( Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data

GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;


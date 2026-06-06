SELECT 
    o."Order ID",
    o."Order Date",
    c."Customer Name",
    c."Region",
    o."Category",
    o."Sales",
    o."Profit"
FROM orders_csv o
INNER JOIN customers_csv c
ON o."Customer ID" = c."Customer ID";


SELECT 
    c."Region",
    ROUND(SUM(o."Sales"), 2) AS Total_Sales
FROM orders_csv o
JOIN customers_csv c
ON o."Customer ID" = c."Customer ID"
GROUP BY c."Region"
ORDER BY Total_Sales DESC;


SELECT 
    o."Category",
    ROUND(SUM(o."Profit") / SUM(o."Sales") * 100, 2) AS Profit_Margin_Percent
FROM orders_csv o
GROUP BY o."Category"
ORDER BY Profit_Margin_Percent DESC;


SELECT 
    MONTH(CAST(o."Order Date" AS DATE)) AS Month,
    ROUND(SUM(o."Sales"), 2) AS Monthly_Sales
FROM orders_csv o
GROUP BY Month
ORDER BY Month;


SELECT 
    c."Customer Name",
    ROUND(SUM(o."Sales"), 2) AS Total_Revenue
FROM orders_csv o
JOIN customers_csv c
ON o."Customer ID" = c."Customer ID"
GROUP BY c."Customer Name"
ORDER BY Total_Revenue DESC
LIMIT 5;
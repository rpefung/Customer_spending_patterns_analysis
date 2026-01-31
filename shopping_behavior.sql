

CREATE DATABASE Shopping_Behavior


USE Shopping_Behavior

SELECT * FROM customer_shopping

/*Checking for missing values*/
SELECT * FROM customer_shopping
WHERE Customer_ID IS NULL

/*Checking for duplicates*/
SELECT Customer_ID, Count(Customer_ID) AS occurences FROM customer_shopping
GROUP BY Customer_ID
HAVING Count(Customer_ID) > 1

SELECT COUNT(*) FROM customer_shopping
--3900 rows 

SELECT Age, COUNT(Age) FROM customer_shopping
GROUP BY Age
Order BY Age ASC

SELECT MAX(Age) FROM customer_shopping
--70
SELECT MIN(Age) FROM customer_shopping
--18
SELECT AVG(Age) FROM customer_shopping
--44

/*Gender Distribution*/
SELECT Gender, COUNT(Gender) AS Num FROM customer_shopping
GROUP BY Gender
--2652 Male, 1248 Female

/*Age distribution by age group*/
CREATE VIEW Age_Group AS
SELECT *, CASE 
		WHEN Age >= 18 AND Age <=34 THEN '18 - 34'
		WHEN Age >= 35 AND Age <=54 THEN '35 - 54'
		ELSE '55+' 
		END AS 'Age Group'
FROM customer_shopping

SELECT * FROM Age_Group

SELECT [Age Group], COUNT(*) AS Num FROM Age_Group
GROUP BY [Age Group]
ORDER BY [Age Group] ASC

SELECT Item_Purchased, COUNT(Item_Purchased) AS Num FROM customer_shopping
GROUP BY Item_Purchased
ORDER BY Num DESC

SELECT Item_Purchased, COUNT(Item_Purchased) AS Num FROM customer_shopping
GROUP BY Item_Purchased
ORDER BY Num DESC

SELECT Category, COUNT(Category) AS Num FROM customer_shopping
GROUP BY Category
ORDER BY Num DESC

SELECT [Age Group], SUM(Purchase_Amount_USD) AS Total_Amount FROM Age_Group
GROUP BY [Age Group]
ORDER BY Total_Amount DESC

SELECT [Age Group], AVG(Purchase_Amount_USD) AS Total_Amount FROM Age_Group
GROUP BY [Age Group]
ORDER BY Total_Amount DESC

/*spending distribution by category*/
SELECT Category, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Category
ORDER BY Total_Amount DESC

/*Average spend by season & category*/
SELECT Category, Season, AVG(Purchase_Amount_USD) AS Avg_Amount FROM customer_shopping
GROUP BY Category, Season
ORDER BY Season 

/*Subscription Status vs spending*/
SELECT Subscription_Status, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Subscription_Status
ORDER BY Total_Amount DESC

/*Discount Applied*/
SELECT Discount_Applied, COUNT(Discount_Applied) AS Num FROM customer_shopping
GROUP BY Discount_Applied
ORDER BY Num DESC

SELECT Discount_Applied, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Discount_Applied
ORDER BY Total_Amount DESC

/*Promo Code vs Spending*/
SELECT Promo_Code_Used, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Promo_Code_Used
ORDER BY Total_Amount DESC

/*previous purchases amount distribution */
SELECT Previous_Purchases, COUNT(Previous_Purchases) AS Num, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Previous_Purchases
ORDER BY Total_Amount DESC

/*purchases amount by payment method*/
SELECT Payment_Method, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Payment_Method
ORDER BY Total_Amount DESC

/*frequency of purchases*/
SELECT Frequency_of_Purchases, COUNT(Frequency_of_Purchases) AS Num FROM customer_shopping
GROUP BY Frequency_of_Purchases
ORDER BY Num DESC

/*purchases amount by frequency of purchases*/
SELECT Frequency_of_Purchases, COUNT(Frequency_of_Purchases) AS Num, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Frequency_of_Purchases
ORDER BY Total_Amount DESC

/*review rating*/
SELECT ROUND(Review_Rating,2) AS Rating, COUNT(Review_Rating) AS Num FROM customer_shopping
GROUP BY Review_Rating
ORDER BY Review_Rating DESC

/*purchases amount by review ratings*/
SELECT ROUND(Review_Rating,2) AS Rating, COUNT(Review_Rating) AS Num, SUM(Purchase_Amount_USD) AS Total_Amount FROM customer_shopping
GROUP BY Review_Rating
ORDER BY Total_Amount DESC


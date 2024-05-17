-- Q1. Write a code to check NULL values
SELECT *
  FROM [corona_virus].[dbo].['Corona Virus Dataset$']
  where [Banking-Financial-Analysis] IS NULL 
     OR [Country/Region] IS NULL 
	 OR [Latitude] IS NULL 
     OR [Longitude] IS NULL
	 OR [Date] IS NULL 
	 OR [Confirmed] IS NULL 
	 OR [Deaths] IS NULL
	 OR [Recovered] IS NULL 

-- Q2. If NULL values are present, update them with zeros for all columns. 
-- We don't have any null value in our database

-- Q3. check total number of rows
SELECT 
      COUNT(*) AS total_rows
FROM [corona_virus].[dbo].['Corona Virus Dataset$']; 

-- Q4. Check what is start_date and end_date
SELECT MIN(TRY_CONVERT(DATE, [Date], 105)) AS start_date,
       MAX(TRY_CONVERT(DATE, [Date], 105)) AS end_date
FROM [corona_virus].[dbo].['Corona Virus Dataset$'];

-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT MONTH(TRY_CONVERT(DATE, [Date], 105))) AS num_month
FROM [corona_virus].[dbo].['Corona Virus Dataset$'];

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
	YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    MAX(Confirmed) AS max_confirmed,
    MAX(Deaths) AS max_deaths,
    MAX(Recovered) AS max_recovered
FROM [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS year,
    MIN(Confirmed) AS min_confirmed,
    MIN(Deaths) AS min_deaths,
    MIN(Recovered) AS min_recovered
FROM [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY YEAR(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY YEAR(TRY_CONVERT(DATE, [Date], 105));

-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS year,
    MAX(Confirmed) AS max_confirmed,
    MAX(Deaths) AS max_deaths,
    MAX(Recovered) AS max_recovered
FROM [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY YEAR(TRY_CONVERT(DATE, [Date], 105))
ORDER BY YEAR(TRY_CONVERT(DATE, [Date], 105));

-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    SUM(Confirmed) AS total_confirmed,
    SUM(Deaths) AS total_deaths,
    SUM(Recovered) AS total_recovered
FROM [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

--Calculate total confirmed cases
SELECT SUM(Confirmed) AS total_confirmed_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

--Calculate average confirmed cases
SELECT AVG(Confirmed) AS average_confirmed_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

--Calculate variance of confirmed cases
SELECT VAR(Confirmed) AS variance_confirmed_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

--Calculate standrd deviation of confirmed cases
SELECT STDEV(Confirmed) AS stdev_confirmed_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 


-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

-- Calculate total confirmed cases per month
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    SUM(Deaths) AS total_deaths
FROM 
    [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Calculate average confirmed cases per month
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    AVG(Deaths) AS average_deaths
FROM 
    [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Calculate variance of confirmed cases per month
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    VAR(Deaths) AS variance_deaths
FROM 
    [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Calculate standard deviation of death cases per month
SELECT 
    YEAR(TRY_CONVERT(DATE, [Date], 105)) AS [Year],
    MONTH(TRY_CONVERT(DATE, [Date], 105)) AS [Month],
    STDEV(Deaths) AS stdev_deaths
FROM 
    [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY 
    YEAR(TRY_CONVERT(DATE, [Date], 105)),
    MONTH(TRY_CONVERT(DATE, [Date], 105)) 
ORDER BY 
    [Year], [Month];

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

--Calculate total recovered cases
SELECT SUM(Recovered) AS total_recovered_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

--Calculate average recovered cases
SELECT AVG(Recovered) AS average_recovered_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

--Calculate variance of recovered cases
SELECT VAR(Recovered) AS variance_recovered_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

--Calculate standrd deviation of recovered cases
SELECT STDEV(Recovered) AS stdev_recovered_cases
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 

-- Q14. Find Country having highest number of the Confirmed case

SELECT [Country/Region], SUM(Confirmed) AS total_Confirmed
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 
GROUP BY [Country/Region]
HAVING SUM(Confirmed) = (
    SELECT MAX(total_Confirmed)
    FROM (
        SELECT SUM(Confirmed) AS total_Confirmed
        FROM [corona_virus].[dbo].['Corona Virus Dataset$']
        GROUP BY [Country/Region]
    ) AS subquery
);

-- Q15. Find Country having lowest number of the death case
SELECT [Country/Region], SUM(Deaths) AS total_deaths
FROM [corona_virus].[dbo].['Corona Virus Dataset$'] 
GROUP BY [Country/Region]
HAVING SUM(Deaths) = (
    SELECT MIN(total_deaths)
    FROM (
        SELECT SUM(Deaths) AS total_deaths
        FROM [corona_virus].[dbo].['Corona Virus Dataset$']
        GROUP BY [Country/Region]
    ) AS subquery
);

-- Q16. Find top 5 countries having highest recovered case

SELECT TOP 5 [Country/Region],SUM(Recovered) AS total_recovered_cases
From [corona_virus].[dbo].['Corona Virus Dataset$']
GROUP BY [Country/Region]
ORDER BY total_recovered_cases DESC;

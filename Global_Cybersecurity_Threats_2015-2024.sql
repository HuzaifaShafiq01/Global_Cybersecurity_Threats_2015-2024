SELECT * FROM dbo.[Global_Cybersecurity_Threats_2015-2024];

SELECT TOP 10 *
FROM dbo.[Global_Cybersecurity_Threats_2015-2024];

--1. How do you assess the completeness of the data?
--Objective: Check for missing or null values 
SELECT 
    COUNT(*) - COUNT(Country) AS Missing_Country,
    COUNT(*) - COUNT(Year) AS Missing_Year,
    COUNT(*) - COUNT(Attack_Type) AS Missing_Attack_Type,
    COUNT(*) - COUNT(Target_Industry) AS Missing_Target_Industry,
    COUNT(*) - COUNT(Financial_Loss_in_Million) AS Missing_Financial_Loss,
    COUNT(*) - COUNT(Number_of_Affected_Users) AS Missing_Affected_Users,
    COUNT(*) - COUNT(Attack_Source) AS Missing_Attack_Source,
    COUNT(*) - COUNT(Security_Vulnerability_Type) AS Missing_Security_Vulnerability_Type,
    COUNT(*) - COUNT(Defense_Mechanism_Used) AS Missing_Defense_Mechanism_Used,
    COUNT(*) - COUNT(Incident_Resolution_Time_in_Hours) AS Missing_Incident_Resolution_Time
FROM dbo.[Global_Cybersecurity_Threats_2015-2024];


--1. What are the most common types of cyberattacks?
 --Most common types of cyberattacks:
SELECT DISTINCT [Attack_Type], COUNT([Attack_Type]) AS Attack_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Attack_Type]
ORDER BY Attack_Count DESC;

--2. Which countries had the most cyberattacks?
--Countries with the most cyberattacks:
SELECT [Country], COUNT([Country]) AS Attack_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Country]
ORDER BY Attack_Count DESC;

--3. Which industries were most affected by cyberattacks?
--Industries most affected by cyberattacks:
SELECT [Target_Industry], COUNT([Target_Industry]) AS Attack_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Target_Industry]
ORDER BY Attack_Count DESC;

--4. What was the average amount of financial loss from cyberattacks?
--Average financial loss from cyberattacks:
SELECT AVG([Financial_Loss_in_Million]) AS Average_Financial_Loss
FROM dbo.[Global_Cybersecurity_Threats_2015-2024];

--5. What were the most common defense mechanisms used?
--Most common defense mechanisms used:
SELECT DISTINCT [Defense_Mechanism_Used], COUNT([Defense_Mechanism_Used]) AS Usage_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Defense_Mechanism_Used]
ORDER BY Usage_Count DESC;
--6. How long did it take on average to resolve the cyberattacks?
-- Average incident resolution time:
SELECT AVG([Incident_Resolution_Time_in_Hours]) AS Avg_Resolution_Time
FROM dbo.[Global_Cybersecurity_Threats_2015-2024];

--7. Who caused the attacks (Hacker Group, Nation-state, etc.)?
-- Attack sources:
SELECT DISTINCT [Attack_Source], COUNT([Attack_Source]) AS Source_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Attack_Source]
ORDER BY Source_Count DESC;


--8. What kinds of security problems (vulnerabilities) were exploited in these attacks?
--Common security vulnerabilities exploited:
SELECT DISTINCT [Security_Vulnerability_Type], COUNT([Security_Vulnerability_Type]) AS Vulnerability_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Security_Vulnerability_Type]
ORDER BY Vulnerability_Count DESC;

--9. How many users were affected by these cyberattacks?
--Total number of affected users:
SELECT SUM([Number_of_Affected_Users]) AS Total_Affected_Users
FROM dbo.[Global_Cybersecurity_Threats_2015-2024];

--10. Which type of attack affected the most users?
--Type of attack affecting the most users:
SELECT [Attack_Type], SUM([Number_of_Affected_Users]) AS Total_Affected_Users
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Attack_Type]
ORDER BY Total_Affected_Users DESC;

--11. How much money did the attacks in the UK cause in financial loss?
--Financial loss caused by attacks in the UK:
SELECT SUM([Financial_Loss_in_Million]) AS Total_Loss_UK
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
WHERE [Country] = 'UK';

--12. Which defense methods helped reduce the time it took to fix the problems?
--Defense methods that helped reduce resolution time:
SELECT [Defense_Mechanism_Used], AVG([Incident_Resolution_Time_in_Hours]) AS Avg_Resolution_Time
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Defense_Mechanism_Used]
ORDER BY Avg_Resolution_Time;

--13. How many cyberattacks happened in each year from 2015 to 2024?
--Cyberattacks by year:
SELECT [Year], COUNT([Year]) AS Attack_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Year]
ORDER BY [Year];

--14. Which country lost the most money because of these cyberattacks?
--Country with the most financial loss:
SELECT [Country], SUM([Financial_Loss_in_Million]) AS Total_Financial_Loss
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Country]
ORDER BY Total_Financial_Loss DESC;

--15. What was the most common attack type in the retail industry?
--Most common attack type in the retail industry:
SELECT [Attack_Type], COUNT([Attack_Type]) AS Attack_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
WHERE [Target_Industry] = 'Retail'
GROUP BY [Attack_Type]
ORDER BY Attack_Count DESC;

--16. Which attack sources (Hacker Group, Insider, etc.) caused the biggest financial loss?
-- Attack sources causing the biggest financial loss:
SELECT [Attack_Source], SUM([Financial_Loss_in_Million]) AS Total_Financial_Loss
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Attack_Source]
ORDER BY Total_Financial_Loss DESC;


--17. How can we find out which attack types cause the most damage?
--Find the attack types causing the most damag
SELECT [Attack_Type], SUM([Financial_Loss_in_Million]) AS Total_Financial_Loss
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Attack_Type]
ORDER BY Total_Financial_Loss DESC;

--18. Which factors (attack type, industry, etc.) affected how long it took to fix the problem?
--Factors affecting incident resolution time:
SELECT [Attack_Type], AVG([Incident_Resolution_Time_in_Hours]) AS Avg_Resolution_Time
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Attack_Type]
ORDER BY Avg_Resolution_Time;

--19. How can we group the countries based on the types of cyberattacks they faced?
--Group countries based on attack types:
SELECT [Country], [Attack_Type], COUNT([Attack_Type]) AS Attack_Count
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
GROUP BY [Country], [Attack_Type]
ORDER BY Attack_Count DESC;


--20. What attack source was the most damaging to the financial sector?
--Attack source most damaging to the financial sector:
SELECT [Attack_Source], SUM([Financial_Loss_in_Million]) AS Total_Financial_Loss
FROM dbo.[Global_Cybersecurity_Threats_2015-2024]
WHERE [Target_Industry] = 'Financial Sector'
GROUP BY [Attack_Source]
ORDER BY Total_Financial_Loss DESC;



















USE p2_population;

-- EXTRACT: PERCENTAGES OF GENDER DISTRIBUTION IN BARCELONA PER YEAR
-- Gender distribution per year
SELECT year, gender, sum(immigrants) as total_immigrants_per_gender
FROM immigrant_gender
GROUP BY gender, year;

-- Immigrants per year
SELECT year, sum(immigrants) as total_immigrants
FROM immigrant_gender
GROUP BY year;

-- Gender distribution per year (percentage)
SELECT i.year, i.gender, ((sum(i.immigrants)/ sub_q.total_immigrants)*100) as percentage_immigrants_per_gender
FROM immigrant_gender AS i
LEFT JOIN(SELECT year, sum(immigrants) as total_immigrants
FROM immigrant_gender
GROUP BY year) sub_q ON i.year = sub_q.year
GROUP BY i.gender, i.year;

-- EXTRACT: PERCENTAGES OF AGE RANGE DISTRIBUTION IN BARCELONA PER YEAR
-- Age distribution per year (percentage)
SELECT i.year, i.age, ((sum(i.immigrants)/ sub_q.total_immigrants)*100) as percentage_immigrants_per_gender
FROM immigrant_age AS i
LEFT JOIN(SELECT year, sum(immigrants) as total_immigrants
FROM immigrant_age
GROUP BY year) sub_q ON i.year = sub_q.year
GROUP BY i.age, i.year;


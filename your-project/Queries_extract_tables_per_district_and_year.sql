USE p2_population;

-- Immigrant age ranges per district and year (percentage)
SELECT i.year, i.district_name, i.age, ((sum(i.immigrants)/sub_q.total_immigrants)*100) AS immigrants_percentage
FROM immigrant_age AS i
LEFT JOIN (SELECT year, district_name, sum(immigrants) as total_immigrants
FROM immigrant_age
GROUP BY district_name, year) sub_q ON i.district_name = sub_q.district_name AND i.year = sub_q.year
GROUP BY i.district_name, i.age, i.year
ORDER BY i.year DESC, i.district_name, i.age ASC;


-- Immigrant gender per district and year (percentage)
SELECT i.year, i.district_name, i.gender, ((sum(i.immigrants)/sub_q.total_immigrants)*100) AS immigrants_percentage
FROM immigrant_gender AS i
LEFT JOIN (SELECT year, district_name, sum(immigrants) as total_immigrants
FROM immigrant_gender
GROUP BY district_name, year) sub_q ON i.district_name = sub_q.district_name AND i.year = sub_q.year
GROUP BY i.district_name, i.gender, i.year
ORDER BY i.year DESC, i.district_name, i.gender ASC;
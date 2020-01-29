USE p2_population;

-- Immigrant age ranges per district and year (percentage)
SELECT a.year, sub_q.district_name, a.age, ((sum(a.immigrants)/sub_q.total_immigrants)*100) AS immigrants_percentage
FROM age AS a
JOIN (SELECT a1.year, d.neig_code, d.district_name, sum(a1.immigrants) as total_immigrants
FROM age AS a1
LEFT JOIN district AS d ON d.neig_code = a1.neig_code
GROUP BY d.district_name, a1.year) sub_q ON a.neig_code = sub_q.neig_code AND a.year = sub_q.year
GROUP BY sub_q.district_name, a.age, a.year
ORDER BY a.year DESC, sub_q.district_name, a.age ASC;


-- Immigrant gender per district and year (percentage)
SELECT g.year, sub_q.district_name, g.gender, ((sum(g.immigrants)/sub_q.total_immigrants)*100) AS immigrants_percentage
FROM gender AS g
JOIN (SELECT g1.year, d.neig_code, d.district_name, sum(g1.immigrants) as total_immigrants
FROM gender AS g1
LEFT JOIN district AS d ON d.neig_code = g1.neig_code
GROUP BY d.district_name, g1.year) sub_q ON g.neig_code = sub_q.neig_code AND g.year = sub_q.year
GROUP BY sub_q.district_name, g.gender, g.year
ORDER BY g.year DESC, sub_q.district_name, g.gender ASC;
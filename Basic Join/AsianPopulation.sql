SELECT SUM(City.population)
FROM City
JOIN Country
    ON City.CountryCode = Country.Code
WHERE Country.continent = "Asia";

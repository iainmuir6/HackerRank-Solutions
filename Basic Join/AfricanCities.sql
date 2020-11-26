SELECT City.name
FROM City
JOIN Country
    ON City.CountryCode = Country.Code
WHERE Country.continent = "Africa";

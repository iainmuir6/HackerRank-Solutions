SELECT Country.continent, FLOOR(AVG(City.population))
FROM City
JOIN Country
    ON City.CountryCode = Country.Code
GROUP BY Country.continent;

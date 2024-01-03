-- START--
create schema cars;
use cars;
-- READ DATA--
select * from car_details;

-- Total cars: To get a count of total records--
select count(*) from car_details;

-- The manager asked employee how many cars will be available in 2023 --
select count(*) from car_details
where year = 2023;

-- The manager asked employee how many cars is available in 2020,2021,2022--
select year,count(*) from car_details
where year in (2020,2021,2022)
group by year;

-- client asked to print total of all cars by year--
select year,count(*) from car_details
group by year;

-- client asked to car dealer agent how many diesel cars will be there in 2020?--
select count(*) from car_details
where year = 2020 and fuel = 'Diesel';

-- The manager told the employee to print all the fuel cars (petrol,CNG,diesel) come by all year--
select fuel, year, count(*) from car_details
where fuel in ('Petrol','CNG','Diesel')
group by fuel, year;

-- which year had more than 100 cars?--
select year, count(*) from  car_details
group by year
having count(*) > 100;

-- All car detail between 2015 to 2023--
select * from car_details
where year between 2015 and 2023;

-- END --


use flights;

/** 1. Which destination in the flights database is the furthest distance away, 
/** based on information in the flights table. Show the SQL query(s) that support your conclusion. */

select dest, max(distance) from flights group by dest order by max(distance) desc limit 1;

/** 2. What are the different numbers of engines in the planes table? 
/** For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result. */

select distinct engines from planes order by engines;

select distinct p.model, p.seats, p.engines from planes p
inner join (select max(seats) as seats, engines from planes group by engines order by max(seats) desc) s 
on s.seats = p.seats and s.engines = p.engines order by p.engines desc, p.seats desc;

/** 3. Show the total number of flights. */

select count(*) from flights;

/** 4. Show the total number of flights by airline (carrier). */

select carrier, count(*) as totalFlights from flights group by carrier;

/** 5. Show all of the airlines, ordered by number of flights in descending order. */

select carrier, count(*) as totalFlights from flights group by carrier order by count(distinct flight) desc;

/** 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order. */

select carrier, count(*) as totalFlights from flights group by carrier order by count(distinct flight) desc limit 5;

/** 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order. */

select carrier, count(*) as totalFlights from flights where distance >= 1000
group by carrier order by count(distinct flight) desc limit 5;

/** 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question. */
/** List the top 5 airlines that have the lowest dep_delay. */

select min(dep_delay), carrier from flights group by carrier order by min(dep_delay) desc limit 5;




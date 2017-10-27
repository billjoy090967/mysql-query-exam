/* 1. Select a distinct list of ordered airports codes. Be sure to name the column correctly. Be sure to order the results correctly.
SELECT DISTINCT departAirport Airports FROM flight;

2. Provide a list of delayed flights departing from San Francisco (SFO).
SELECT airline.name, flight.flightNumber, flight.scheduledDepartDateTime, flight.arriveAirport, flight.status
 FROM flight INNER JOIN airline ON flight.airlineID = airline.ID
 WHERE status = "delayed" and departAirport = "SFO";

3.Provide a distinct list of cities that American airlines departs from.
SELECT DISTINCT departAirport Cities FROM flight WHERE airlineID = 1;

4. Provide a distinct list of airlines that conduct flights departing from ATL.
SELECT DISTINCT name Airline FROM airline INNER JOIN flight
 ON flight.airlineID = airline.ID WHERE departAirport = "ATL";

5. Provide a list of airlines, flight numbers, departing airports, and arrival airports where flights departed on time.
SELECT name, flightNumber, departAirport, arriveAirport FROM flight INNER JOIN airline
 ON flight.airlineID = airline.ID WHERE actualDepartDateTime = scheduledDepartDateTime;

6. Provide a list of airlines, flight numbers, gates, status, and arrival times arriving into Charlotte (CLT) on 10-30-2017. Order your results by the arrival time.
SELECT name Airline, flightNumber Flight, gate Gate, TIME(scheduledArriveDateTime) Arrival, status  Status
 FROM flight INNER JOIN airline ON flight.airlineID = airline.ID WHERE arriveAirport = "CLT" and Status = "scheduled";

7. List the number of reservations by flight number. Order by reservations in descending order.
SELECT flightNumber flight, COUNT(reservation.ID) reservations FROM reservation
 INNER JOIN flight ON flight.ID = reservation.flightID GROUP BY flight ORDER BY reservations DESC;

8. List the average ticket cost for coach by airline and route. Order by AverageCost in descending order.
SELECT name airline, departAirport, arriveAirport, 
AVG(cost) AverageCost FROM airline INNER JOIN flight ON
 flight.airlineID = airline.ID INNER JOIN reservation ON reservation.flightID = flight.ID 
 WHERE class= "coach" GROUP BY airline, departAirport ORDER BY AVG(cost) DESC, departAirport DESC;
 
9. Which route is the longest?
SELECT departAirport, arriveAirport, miles FROM flight ORDER BY miles DESC limit 1;

10. List the top 5 passengers that have flown the most miles. Order by miles.
SELECT firstName, lastName, SUM(miles) miles FROM reservation
 INNER JOIN passenger ON passenger.ID=reservation.passengerID
 INNER JOIN flight ON flight.ID = reservation.flightID GROUP BY lastName ORDER BY miles DESC limit 5;
 
 11. Provide a list of American airline flights ordered by route and arrival date and time.
SELECT name Name, CONCAT(departAirport, " --> ", arriveAirport) Route, DATE(scheduledArriveDateTime) 'Arrive Date', 
TIME(scheduledArriveDateTime) 'Arrival Time' FROM flight INNER JOIN airline ON flight.airlineID = airline.ID
 WHERE name = "American" ORDER BY Route, 'Arrive Date' DESC;
 
 12. Provide a report that counts the number of reservations and totals the reservation costs (as Revenue) by Airline, flight, and route. Order the report by total revenue in descending order.
SELECT name Name, flightNumber Flight, CONCAT(departAirport, " --> ", arriveAirport) Route, 
COUNT(reservation.ID) 'Reservation Count', SUM(Cost) Revenue FROM flight 
INNER JOIN airline ON flight.airlineID = airline.ID
 INNER JOIN reservation ON flight.ID = reservation.flightID GROUP BY reservation.flightID ORDER BY Revenue DESC;

13. List the average cost per reservation by route. Round results down to the dollar.
SELECT CONCAT(departAirport, " --> ", arriveAirport) Route, ROUND(AVG(cost), 0) 'Avg Revenue' 
FROM flight INNER JOIN reservation ON flight.ID = reservation.flightID 
GROUP BY reservation.flightID ORDER BY AVG(cost) DESC;

14. List the average miles per flight by airline.
SELECT name Airline, AVG(miles) 'Avg Miles Per Flight' 
FROM airline INNER JOIN flight ON flight.airlineID = airline.ID GROUP BY Airline;

15. Which airlines had flights that arrived early?
SELECT name Airline FROM airline INNER JOIN flight ON
 flight.airlineID = airline.ID WHERE scheduledArriveDateTime > actualArriveDateTime
 GROUP BY Airline;
*/




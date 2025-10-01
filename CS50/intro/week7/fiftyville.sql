-- Review tables
.tables
    --airports              crime_scene_reports   people
    --atm_transactions      flights               phone_calls
    --bakery_security_logs  interviews
    --bank_accounts         passengers

--
.schema crime_scene_reports
-- Look at crime scene reports from the time
SELECT description, id FROM crime_scene_reports WHERE year = 2024 AND month = 7 AND day = 28 AND street = 'Humphrey Street';
    --| Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
    --  Interviews were conducted today with three witnesses who were present at the time –
    --  each of their interview transcripts mentions the bakery. | 295 |
    --| Littering took place at 16:36. No known witnesses. -- Likely irrelevant

-- Look at relevant interviews. 3 contain mention of bakery
.schema interviews
--
SELECT name, transcript FROM interviews WHERE year = 2024 AND month = 7 AND day = 28;
    -- 1 Ruth | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away.
    -- If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot
    -- in that time frame.
    -- 2 Eugene | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's
    -- bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
    -- 3, 4 Raymond | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call,
    -- I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then
    -- asked the person on the other end of the phone to purchase the flight ticket. |

-- Check license plates of those leaving bakery
.schema bakery_security_logs
--
SELECT * from bakery_security_logs WHERE year = 2024 AND month = 7 AND day = 28;
-- 1 ALL CARS WITHIN 10 MINUTES OF THEFT
| 260 | 2024 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
| 261 | 2024 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 262 | 2024 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
| 263 | 2024 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
| 264 | 2024 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
| 265 | 2024 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
| 266 | 2024 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
| 267 | 2024 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |

-- Check atm transactions on Leggett
.schema atm_transactions
--
SELECT * from atm_transactions WHERE year = 2024 AND month = 7 AND day = 28 AND atm_location = 'Leggett Street';
-- 2 ATM transactions on Leggett
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| 246 | 28500762       | 2024 | 7     | 28  | Leggett Street | withdraw         | 48     |
| 264 | 28296815       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 266 | 76054385       | 2024 | 7     | 28  | Leggett Street | withdraw         | 60     |
| 267 | 49610011       | 2024 | 7     | 28  | Leggett Street | withdraw         | 50     |
| 269 | 16153065       | 2024 | 7     | 28  | Leggett Street | withdraw         | 80     |
| 275 | 86363979       | 2024 | 7     | 28  | Leggett Street | deposit          | 10     |
| 288 | 25506511       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 313 | 81061156       | 2024 | 7     | 28  | Leggett Street | withdraw         | 30     |
| 336 | 26013199       | 2024 | 7     | 28  | Leggett Street | withdraw         | 35     |
+-----+----------------+------+-------+-----+----------------+------------------+--------+

-- Check short phone calls from after robbery
.schema phone_calls
--
-- 3 Phone calls less than a minute
SELECT * from phone_calls WHERE year = 2024 AND month = 7 AND day = 28 AND duration < 60;
+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 221 | (130) 555-0289 | (996) 555-8899 | 2024 | 7     | 28  | 51       |
| 224 | (499) 555-9472 | (892) 555-8872 | 2024 | 7     | 28  | 36       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |
| 251 | (499) 555-9472 | (717) 555-1342 | 2024 | 7     | 28  | 50       |
| 254 | (286) 555-6063 | (676) 555-6554 | 2024 | 7     | 28  | 43       |
| 255 | (770) 555-1861 | (725) 555-3243 | 2024 | 7     | 28  | 49       |
| 261 | (031) 555-6622 | (910) 555-3251 | 2024 | 7     | 28  | 38       |
| 279 | (826) 555-1652 | (066) 555-9701 | 2024 | 7     | 28  | 55       |
| 281 | (338) 555-6650 | (704) 555-2131 | 2024 | 7     | 28  | 54       |

-- Check flight records, first flight out of Fiftyville, check destination city
.schema flights
--
.schema airports
--
SELECT full_name from airports;
--
SELECT id FROM airports WHERE full_name = 'Fiftyville Regional Airport';
+----+
| id |
+----+
| 8  |
+----+
--
SELECT * from flights WHERE year = 2024 AND month = 7 AND day = 29 AND origin_airport_id = 8 ORDER BY hour ASC LIMIT 1;
+----+-------------------+------------------------+------+-------+-----+------+--------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
+----+-------------------+------------------------+------+-------+-----+------+--------+
| 36 | 8                 | 4                      | 2024 | 7     | 29  | 8    | 20     |
+----+-------------------+------------------------+------+-------+-----+------+--------+
--
SELECT full_name FROM airports WHERE id = 4;
-- 4 - Destination of criminals
+-------------------+
|     full_name     |
+-------------------+
| LaGuardia Airport |
+-------------------+

SELECT city FROM airports WHERE full_name = 'LaGuardia Airport';
+---------------+
|     city      |
+---------------+
| New York City |
+---------------+

--Check list of passengers on the flight, cross reference to their license plate numbers
.schema passengers
--
.schema people
--
SELECT people.name, people.phone_number, people.license_plate FROM people
JOIN passengers ON passengers.passport_number = people.passport_number
JOIN flights ON passengers.flight_id = flights.id
WHERE flights.id = 36;
+--------+----------------+---------------+
|  name  |  phone_number  | license_plate |
+--------+----------------+---------------+
| Doris  | (066) 555-9701 | M51FA04       |
| Sofia  | (130) 555-0289 | G412CB7       | MATCH | 264 | 2024 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
| Bruce  | (367) 555-5533 | 94KL13X       | MATCH | 261 | 2024 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| Edward | (328) 555-1152 | 130LD9Z       |
| Kelsey | (499) 555-9472 | 0NTHK55       | MATCH | 267 | 2024 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
| Taylor | (286) 555-6063 | 1106N58       |
| Kenny  | (826) 555-1652 | 30G67EN       |
| Luca   | (389) 555-5198 | 4328GD8       | MATCH | 263 | 2024 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
+--------+----------------+---------------+
-- Matches to flight and license plate numbers found. Main suspects identified.
Suspects: Sofia, Bruce, Kelsey, Luca -- On the plane, seen fleeing the scene
Now compare to ATM records and phone calls
--
.schema atm_transactions
.schema bank_accounts
.schema people

-- Cross-reference suspects to previous atm transactions
SELECT name FROM people
JOIN bank_accounts ON bank_accounts.person_id = people.id
JOIN atm_transactions ON atm_transactions.account_number = bank_accounts.account_number
WHERE atm_transactions.year = 2024 AND atm_transactions.month = 7 AND atm_transactions.day = 28
AND atm_transactions.atm_location = 'Leggett Street';
+---------+
|  name   |
+---------+
| Bruce   | Match
| Kaelyn  |
| Diana   |
| Brooke  |
| Kenny   |
| Iman    |
| Luca    | Match
| Taylor  |
| Benista |
+---------+
--
Suspects now down to just Bruce and Luca
Time to check phone calls

-- No need to consult database. Simple check of previous info shows only one suspects
-- phone number from passenger information matches atm_transaction phone number -- Bruce.
Only one person matches - Bruce. His phone number was used shortly after the robbery.

| Bruce  | (367) 555-5533 | 94KL13X       | MATCH | 261 | 2024 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |

Bruce is the thief. He escaped to New York City. Now to track down his accomplice via caller ID.
(375) 555-8161 is the receiver phone.

SELECT * FROM people WHERE phone_number = '(367) 555-5533';
+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+-------+----------------+-----------------+---------------+

-- Check Robins info from receiver number taken from phone call
SELECT * FROM people WHERE phone_number = '(375) 555-8161';
+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 864400 | Robin | (375) 555-8161 | NULL            | 4V16VO0       |
+--------+-------+----------------+-----------------+---------------+


  
Criminal: Bruce
Accomplice: Robin
Destination: New York City
Case: Closed

**Conan theme starts playing**

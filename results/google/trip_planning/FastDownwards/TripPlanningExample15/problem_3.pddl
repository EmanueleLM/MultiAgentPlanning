(define (problem trip-berlin-porto-krakow)
  (:domain travel-domain)
  (:objects
    traveler - person
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    (at traveler berlin day1)
    (occupied traveler day1)
  )

  (:goal (and
    ;; Berlin required stay: 6 days (day1..day6)
    (at traveler berlin day1)
    (at traveler berlin day2)
    (at traveler berlin day3)
    (at traveler berlin day4)
    (at traveler berlin day5)
    (at traveler berlin day6)

    ;; Krakow required stay: 5 days (day6..day10)
    (at traveler krakow day6)
    (at traveler krakow day7)
    (at traveler krakow day8)
    (at traveler krakow day9)
    (at traveler krakow day10)

    ;; Porto required stay: 2 days including the wedding between day10 and day11 (day10..day11)
    (at traveler porto day10)
    (at traveler porto day11)
  ))
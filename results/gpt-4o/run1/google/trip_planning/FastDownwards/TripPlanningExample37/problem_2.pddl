(define (problem visit_european_cities)
  (:domain european_trip)

  (:objects
    reykjavik milan porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day)

  (:init
    (at reykjavik day1)
    (flight_available reykjavik milan)
    (flight_available milan porto)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10))

  (:goal (and
    (at reykjavik day1)
    (at reykjavik day2)
    (at reykjavik day3)
    (at reykjavik day4)
    (at reykjavik day5)
    (at reykjavik day6)
    (at milan day7)
    (at milan day8)
    (at porto day9)
    (at porto day10)))
)
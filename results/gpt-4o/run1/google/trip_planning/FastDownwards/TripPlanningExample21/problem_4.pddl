(define (problem european_trip)

  (:domain trip_planning)

  (:objects
    venice mykonos vienna - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (at_city mykonos day1)
    (has_flight mykonos vienna)
    (has_flight vienna venice)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
  )

  (:goal (and
    (city_visited venice)
    (city_visited mykonos)
    (city_visited vienna)
  ))
)
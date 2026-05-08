(define (problem trip_instance)
  (:domain jack_of_all_trades_trip)
  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )
  (:init
    (city paris) (city istanbul) (city salzburg)
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6) (day day7)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6) (next day6 day7)
    (flight paris istanbul) (flight istanbul paris)
    (flight istanbul salzburg) (flight salzburg istanbul)
    (at paris day1)
  )
  (:goal (and
    (at paris day1)
    (at paris day2)
    (at salzburg day3)
    (at salzburg day4)
    (at salzburg day5)
    (at salzburg day6)
    (at salzburg day7)
  ))
)
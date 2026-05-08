(define (problem european_trip_problem)
  (:domain european_trip)
  (:objects
    paris salzburg istanbul - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )
  (:init
    (current_city paris day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (flight_exists paris istanbul)
    (flight_exists istanbul salzburg)
  )
  (:goal (and
    (attended_conference day1)
    (attended_conference day2)
    (current_city salzburg day7)
  ))
)
(define (problem travel-problem)
  (:domain travel-domain)
  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )
  (:init
    (at paris day1)
    (day-free day2)
    (day-free day3)
    (day-free day4)
    (day-free day5)
    (day-free day6)
    (day-free day7)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)

    (direct-flight paris istanbul)
    (direct-flight istanbul paris)
    (direct-flight istanbul salzburg)
    (direct-flight salzburg istanbul)
  )
  (:goal (and
    (at paris day1)
    (at paris day2)
    (at istanbul day3)
    (at istanbul day4)
    (at salzburg day5)
    (at salzburg day6)
    (at salzburg day7)
  ))
)
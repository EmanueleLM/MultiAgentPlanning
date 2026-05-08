(define (problem trip_planning_example47_problem)
  (:domain trip_planning_example47)

  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )

  (:init
    (direct paris istanbul)
    (direct istanbul paris)
    (direct istanbul salzburg)
    (direct salzburg istanbul)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)

    (in_city paris day1)
    (day_used day1)
    (visited paris)
  )

  (:goal
    (and
      (in_city paris day2)
      (in_city istanbul day3)
      (in_city istanbul day4)
      (in_city salzburg day5)
      (in_city salzburg day6)
      (in_city salzburg day7)
      (visited paris)
      (visited istanbul)
      (visited salzburg)
    )
  )
)
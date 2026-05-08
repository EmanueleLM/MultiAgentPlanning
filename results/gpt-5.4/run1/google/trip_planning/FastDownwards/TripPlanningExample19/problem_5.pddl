(define (problem trip_planning_example19_problem)
  (:domain trip_planning_example19)

  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (direct_flight brussels valencia)
    (direct_flight valencia brussels)
    (direct_flight nice brussels)
    (direct_flight brussels nice)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)

    (current_day day1)
  )

  (:goal
    (and
      (current_day day9)
      (visited brussels)
      (visited valencia)
      (visited nice)
      (friends_met)

      (in_city_on nice day1)
      (in_city_on nice day2)
      (in_city_on nice day3)
      (in_city_on nice day4)
      (in_city_on nice day5)
      (in_city_on nice day6)

      (in_city_on brussels day7)
      (in_city_on brussels day8)

      (in_city_on valencia day9)
    )
  )
)
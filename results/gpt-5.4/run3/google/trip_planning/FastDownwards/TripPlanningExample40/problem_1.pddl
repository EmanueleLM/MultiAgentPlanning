(define (problem trip_planning_example40_problem)
  (:domain trip_planning_example40)

  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)

    (direct_flight oslo reykjavik)
    (direct_flight reykjavik oslo)
    (direct_flight manchester oslo)
    (direct_flight oslo manchester)

    (at manchester)
    (current_day day1)
    (visited_day day1 manchester)
  )

  (:goal
    (and
      (visited_day day1 manchester)
      (visited_day day2 manchester)

      (visited_day day3 oslo)
      (visited_day day4 oslo)
      (visited_day day5 oslo)
      (visited_day day6 oslo)
      (visited_day day7 oslo)
      (visited_day day8 oslo)
    )
  )
)
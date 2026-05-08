(define (problem trip_planning_example3_problem)
  (:domain trip_planning_example3)

  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )

  (:init
    (at berlin)

    (direct_flight berlin warsaw)
    (direct_flight warsaw berlin)
    (direct_flight warsaw bucharest)
    (direct_flight bucharest warsaw)

    (current_day day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)

    (stay_need_berlin_3)
    (stay_need_warsaw_3)
    (stay_need_bucharest_2)

    (friend_window_open day5)
    (friend_window_open day6)
  )

  (:goal
    (and
      (trip_finished)
    )
  )
)
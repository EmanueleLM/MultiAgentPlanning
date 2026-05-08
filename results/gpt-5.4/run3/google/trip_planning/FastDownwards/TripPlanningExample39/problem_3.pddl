(define (problem trip_planning_example39_problem)
  (:domain trip_planning_example39)

  (:objects
    porto barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (direct porto barcelona)
    (direct barcelona porto)
    (direct barcelona florence)
    (direct florence barcelona)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)

    (current_day d1)

    (window_day d1)
    (window_day d2)
    (window_day d3)

    (total_days_in porto d1)
    (total_days_in barcelona d0)
    (total_days_in florence d0)

    (goal_days porto d3)
    (goal_days barcelona d7)
    (goal_days florence d4)
  )

  (:goal
    (and
      (current_day d12)
      (visited_porto_in_window)
      (total_days_in porto d3)
      (total_days_in barcelona d7)
      (total_days_in florence d4)
    )
  )
)
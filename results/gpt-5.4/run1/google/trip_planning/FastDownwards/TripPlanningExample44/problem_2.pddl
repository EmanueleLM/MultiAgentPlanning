(define (problem trip_planning_example44_problem)
  (:domain trip_planning_example44)

  (:objects
    rome lyon zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
  )

  (:init
    (at zurich)
    (current_day day_1)
    (days_in zurich day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)
    (next day_14 day_15)
    (next day_15 day_16)
    (next day_16 day_17)

    (direct rome lyon)
    (direct lyon rome)
    (direct zurich rome)
    (direct rome zurich)

    (wedding_window day_1)
    (wedding_window day_2)
    (wedding_window day_3)
    (wedding_window day_4)
    (wedding_window day_5)
    (wedding_window day_6)
    (wedding_window day_7)

    (goal_days rome day_1)
    (goal_days rome day_2)
    (goal_days rome day_3)
    (goal_days rome day_4)
    (goal_days rome day_5)
    (goal_days rome day_6)

    (goal_days lyon day_1)
    (goal_days lyon day_2)
    (goal_days lyon day_3)
    (goal_days lyon day_4)
    (goal_days lyon day_5)
    (goal_days lyon day_6)

    (goal_days zurich day_1)
    (goal_days zurich day_2)
    (goal_days zurich day_3)
    (goal_days zurich day_4)
    (goal_days zurich day_5)
    (goal_days zurich day_6)
    (goal_days zurich day_7)
  )

  (:goal
    (and
      (days_in rome day_1)
      (days_in rome day_2)
      (days_in rome day_3)
      (days_in rome day_4)
      (days_in rome day_5)
      (days_in rome day_6)

      (days_in lyon day_7)
      (days_in lyon day_8)
      (days_in lyon day_9)
      (days_in lyon day_10)
      (days_in lyon day_11)
      (days_in lyon day_12)

      (days_in zurich day_1)
      (days_in zurich day_2)
      (days_in zurich day_3)
      (days_in zurich day_4)
      (days_in zurich day_5)
      (days_in zurich day_6)
      (days_in zurich day_7)

      (wedding_attended)
      (current_day day_17)
    )
  )
)
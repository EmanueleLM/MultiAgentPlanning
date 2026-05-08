(define (problem trip_planning_example11_instance)
  (:domain trip_planning_example11)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (at vienna)
    (current_day day_1)

    (flight vienna valencia)
    (flight valencia vienna)
    (flight vienna vilnius)
    (flight vilnius vienna)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)

    (stay_requirement vienna day_1)
    (stay_requirement vienna day_2)
    (stay_requirement vienna day_3)
    (stay_requirement vienna day_4)
    (stay_requirement vienna day_5)

    (stay_requirement vilnius day_6)
    (stay_requirement vilnius day_7)
    (stay_requirement vilnius day_8)
    (stay_requirement vilnius day_10)
    (stay_requirement vilnius day_11)

    (stay_requirement valencia day_9)
    (stay_requirement valencia day_12)
    (stay_requirement valencia day_13)
    (stay_requirement valencia day_14)
    (stay_requirement valencia day_15)
    (stay_requirement valencia day_7)
    (stay_requirement valencia day_8)
  )

  (:goal
    (and
      (current_day day_16)
      (at valencia)
    )
  )
)
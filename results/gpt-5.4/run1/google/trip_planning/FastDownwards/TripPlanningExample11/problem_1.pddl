(define (problem trip_planning_example11_instance)
  (:domain trip_planning_example11)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (at vienna)
    (current_day day_1)

    (direct_flight vienna valencia)
    (direct_flight valencia vienna)
    (direct_flight vilnius vienna)
    (direct_flight vienna vilnius)

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

    (must_be_in valencia day_9)
    (must_be_in valencia day_15)
  )

  (:goal
    (and
      (current_day day_16)

      (visited vienna day_1)
      (visited vienna day_2)
      (visited vienna day_3)
      (visited vienna day_4)
      (visited vienna day_5)

      (visited vilnius day_6)
      (visited vilnius day_7)
      (visited vilnius day_8)
      (visited vilnius day_10)
      (visited vilnius day_11)

      (visited valencia day_9)
      (visited valencia day_12)
      (visited valencia day_13)
      (visited valencia day_14)
      (visited valencia day_15)
      (visited valencia day_7)
      (visited valencia day_8)

      (at valencia)
    )
  )
)
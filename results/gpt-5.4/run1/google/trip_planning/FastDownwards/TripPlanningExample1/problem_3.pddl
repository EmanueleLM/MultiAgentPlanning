(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (at riga)
    (current_day d1)

    (visited_day_riga d1)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)

    (direct_flight riga manchester)
    (direct_flight manchester riga)
    (direct_flight manchester split)
  )

  (:goal
    (and
      (current_day d15)

      (visited_day_riga d1)
      (visited_day_riga d2)
      (visited_day_riga d3)
      (visited_day_riga d4)
      (visited_day_riga d5)
      (visited_day_riga d6)
      (visited_day_riga d7)

      (visited_day_manchester d8)
      (visited_day_manchester d9)
      (visited_day_manchester d10)
      (visited_day_manchester d11)

      (visited_day_split d12)
      (visited_day_split d13)
      (visited_day_split d14)
      (visited_day_split d15)
    )
  )
)
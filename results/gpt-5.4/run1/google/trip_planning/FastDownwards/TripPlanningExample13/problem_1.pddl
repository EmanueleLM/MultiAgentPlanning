(define (problem tripplanningexample13)
  (:domain european_trip_17days)

  (:objects
    manchester bucharest lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
  )

  (:init
    (at manchester)
    (today d1)

    (flight manchester bucharest)
    (flight bucharest manchester)
    (flight bucharest lyon)
    (flight lyon bucharest)

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
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)
    (next d16 d17)

    (window_day d13)
    (window_day d14)
    (window_day d15)
    (window_day d16)
    (window_day d17)
  )

  (:goal
    (and
      (visited_manchester d1)
      (visited_manchester d2)
      (visited_manchester d3)
      (visited_manchester d4)
      (visited_manchester d5)
      (visited_manchester d6)
      (visited_manchester d7)

      (visited_bucharest d8)
      (visited_bucharest d9)
      (visited_bucharest d10)
      (visited_bucharest d11)
      (visited_bucharest d12)
      (visited_bucharest d13)
      (visited_bucharest d14)

      (visited_lyon d15)
      (visited_lyon d16)
      (visited_lyon d17)

      (relative_visit_done d13)
      (relative_visit_done d14)
      (relative_visit_done d15)
      (relative_visit_done d16)
      (relative_visit_done d17)

      (trip_finished)
    )
  )
)
(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

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

    (current_day d1)
  )

  (:goal
    (and
      (visited_day d15)
      (current_day d15)

      (in_city riga d1)
      (in_city riga d2)
      (in_city riga d3)
      (in_city riga d4)
      (in_city riga d5)
      (in_city riga d6)
      (in_city riga d7)

      (in_city manchester d8)
      (in_city manchester d9)
      (in_city manchester d10)
      (in_city manchester d11)

      (in_city split d12)
      (in_city split d13)
      (in_city split d14)
      (in_city split d15)
    )
  )
)
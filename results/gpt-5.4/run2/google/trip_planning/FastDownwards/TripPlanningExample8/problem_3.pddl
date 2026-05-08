(define (problem tripplanningexample8_problem_min_init)
  (:domain tripplanningexample8_min_init)

  (:objects
    athens zurich krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (current_day d1)
    (at athens)
    (need_athens_1)
    (need_zurich_1)
    (need_krakow_1)
  )

  (:goal
    (and
      (trip_finished)
    )
  )
)
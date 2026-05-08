(define (problem tripplanningexample36_problem)
  (:domain tripplanningexample36)

  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (at florence)
    (current_day d1)
    (final_day d13)

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

    (direct florence munich)
    (direct munich florence)
    (direct florence warsaw)
    (direct warsaw florence)
  )

  (:goal
    (and
      (trip_finished)

      (assigned d1 florence)
      (assigned d2 florence)

      (assigned d3 warsaw)
      (assigned d4 warsaw)
      (assigned d5 warsaw)
      (assigned d6 warsaw)
      (assigned d7 warsaw)
      (assigned d8 warsaw)
      (assigned d9 warsaw)

      (assigned d10 munich)
      (assigned d11 munich)
      (assigned d12 munich)
      (assigned d13 munich)
    )
  )
)
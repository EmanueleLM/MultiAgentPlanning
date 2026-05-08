(define (problem tripplanningexample36_problem)
  (:domain tripplanningexample36)

  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (at florence)
    (current_day d1)

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
      (spent d1 florence)
      (spent d2 florence)

      (spent d3 warsaw)
      (spent d4 warsaw)
      (spent d5 warsaw)
      (spent d6 warsaw)
      (spent d7 warsaw)
      (spent d8 warsaw)
      (spent d9 warsaw)

      (spent d10 munich)
      (spent d11 munich)
      (spent d12 munich)
      (spent d13 munich)
    )
  )
)
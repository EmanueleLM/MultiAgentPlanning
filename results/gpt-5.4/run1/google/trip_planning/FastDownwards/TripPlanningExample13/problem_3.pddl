(define (problem tripplanningexample13_problem)
  (:domain tripplanningexample13_domain)

  (:objects
    manchester bucharest lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
  )

  (:init
    (at manchester)
    (current_day d1)

    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)

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

    (last_day d17)
  )

  (:goal
    (and
      (visited_on manchester d1)
      (visited_on manchester d2)
      (visited_on manchester d3)
      (visited_on manchester d4)
      (visited_on manchester d5)
      (visited_on manchester d6)
      (visited_on manchester d7)

      (visited_on bucharest d8)
      (visited_on bucharest d9)
      (visited_on bucharest d10)
      (visited_on bucharest d11)
      (visited_on bucharest d12)
      (visited_on bucharest d13)
      (visited_on bucharest d14)

      (visited_on lyon d13)
      (visited_on lyon d14)
      (visited_on lyon d15)
      (visited_on lyon d16)
      (visited_on lyon d17)

      (visited_on lyon d15)
      (visited_on lyon d16)
      (visited_on lyon d17)

      (finished)
    )
  )
)
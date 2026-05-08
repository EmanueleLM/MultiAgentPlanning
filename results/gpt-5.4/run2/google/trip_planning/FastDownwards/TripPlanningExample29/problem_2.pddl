(define (problem tripplanningexample29_problem)
  (:domain tripplanningexample29)

  (:objects
    frankfurt krakow dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (current d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct frankfurt dubrovnik)
    (direct dubrovnik frankfurt)

    (need_f_1)
    (need_d_1)
    (need_k_1)
  )

  (:goal
    (and
      (finished)
      (current d10)
      (at krakow)
      (occupied krakow d9)
      (occupied krakow d10)

      (not (need_f_1))
      (not (need_f_2))
      (not (need_f_3))

      (not (need_d_1))
      (not (need_d_2))
      (not (need_d_3))
      (not (need_d_4))
      (not (need_d_5))
      (not (need_d_6))
      (not (need_d_7))

      (not (need_k_1))
      (not (need_k_2))
    )
  )
)
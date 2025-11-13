(define (problem tripplanningexample22-problem)
  (:domain trip-planning-example22)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    berlin frankfurt bucharest - city
    fr1 fr2 - frtoken
    bu1 bu2 - butoken
  )
  (:init
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

    (direct berlin frankfurt)
    (direct frankfurt berlin)
    (direct frankfurt bucharest)
    (direct bucharest frankfurt)

    (is-berlin berlin)
    (is-frankfurt frankfurt)
    (is-bucharest bucharest)

    (current d1)
    (last-city berlin)

    (avail-fr fr1)
    (avail-fr fr2)
    (avail-bu bu1)
    (avail-bu bu2)
  )
  (:goal
    (and
      ; All days must be assigned
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)
      (assigned d11)

      ; Attend the Berlin show on days 1-7
      (in d1 berlin)
      (in d2 berlin)
      (in d3 berlin)
      (in d4 berlin)
      (in d5 berlin)
      (in d6 berlin)
      (in d7 berlin)

      ; Exactly two days in Frankfurt and two in Bucharest (via token consumption)
      (used-fr fr1)
      (used-fr fr2)
      (used-bu bu1)
      (used-bu bu2)
    )
  )
)
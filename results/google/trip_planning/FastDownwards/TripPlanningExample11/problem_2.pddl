(define (problem tripplanningexample11-problem)
  (:domain tripplanningexample11)
  (:objects
    vienna vilnius valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    (connected vienna valencia)
    (connected valencia vienna)
    (connected vilnius vienna)
    (connected vienna vilnius)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15)
    (last-day d15)
    (current-day d1)
    (at vienna)
  )
  (:goal
    (and
      (done)
      (present d9 valencia)
      (present d15 valencia)
      (visited vienna)
      (visited vilnius)
      (visited valencia)
    )
  )
)
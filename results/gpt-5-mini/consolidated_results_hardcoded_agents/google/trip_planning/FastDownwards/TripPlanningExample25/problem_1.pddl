(define (problem trip-problem)
  (:domain travel-domain)
  (:objects
    valencia lyon split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )
  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)
    (connected valencia lyon) (connected lyon valencia)
    (connected lyon split) (connected split lyon)
    (at valencia d1)
  )
  (:goal
    (and
      (at valencia d1) (at valencia d2) (at valencia d3) (at valencia d4) (at valencia d5)
      (at split d10) (at split d11) (at split d12) (at split d13) (at split d14) (at split d15) (at split d16)
      (at lyon d6) (at lyon d7) (at lyon d8) (at lyon d9) (at lyon d10) (at lyon d11)
    )
  )
  (:metric minimize (total-cost))
)
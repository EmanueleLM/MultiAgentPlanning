(define (problem eurotrip-17days-instance)
  (:domain eurotrip-17days)
  (:objects
    manchester bucharest lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
  )
  (:init
    ; start state
    (current-day d1)
    (at manchester d1)

    ; day succession
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

    ; direct-flight connectivity (bidirectional)
    (flight manchester bucharest)
    (flight bucharest manchester)
    (flight bucharest lyon)
    (flight lyon bucharest)

    ; enforced city per day (hard constraints incl. Lyon days 13-17 and audited allocation)
    (must-at manchester d1)
    (must-at manchester d2)
    (must-at manchester d3)
    (must-at manchester d4)
    (must-at manchester d5)

    (must-at bucharest d6)
    (must-at bucharest d7)
    (must-at bucharest d8)
    (must-at bucharest d9)
    (must-at bucharest d10)
    (must-at bucharest d11)
    (must-at bucharest d12)

    (must-at lyon d13)
    (must-at lyon d14)
    (must-at lyon d15)
    (must-at lyon d16)
    (must-at lyon d17)
  )
  (:goal (and
    (current-day d17)
  ))
)
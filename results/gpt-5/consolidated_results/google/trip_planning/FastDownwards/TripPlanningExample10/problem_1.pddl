(define (problem trip-planning-9days-instance)
  (:domain trip-planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    oslo dublin valencia - city
  )
  (:init
    (first d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ; staying in place is always allowed
    (connected oslo oslo)
    (connected dublin dublin)
    (connected valencia valencia)

    ; direct flights only
    (connected oslo dublin)
    (connected dublin oslo)
    (connected dublin valencia)
    (connected valencia dublin)
  )
  (:goal (and
    ; enforce 3 days in Oslo
    (at d1 oslo)
    (at d2 oslo)
    (at d3 oslo)
    ; enforce 5 days in Valencia within days 5-9
    (at d5 valencia)
    (at d6 valencia)
    (at d7 valencia)
    (at d8 valencia)
    (at d9 valencia)
  ))
)
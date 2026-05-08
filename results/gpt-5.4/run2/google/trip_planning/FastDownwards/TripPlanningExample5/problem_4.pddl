(define (problem trip_planning_example5_instance)
  (:domain trip_planning_example5)

  (:init
    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)

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

    (current_day d1)
  )

  (:goal
    (and
      (in_city dubrovnik d12)
      (in_city dubrovnik d16)
      (current_day d16)
    )
  )
)
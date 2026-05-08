(define (problem trip_planning_example5_instance)
  (:domain trip_planning_example5)

  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
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
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    (direct_flight oslo dubrovnik)
    (direct_flight dubrovnik oslo)
    (direct_flight porto oslo)
    (direct_flight oslo porto)
  )

  (:goal
    (and
      (current d16)

      (visited d1 porto)
      (visited d2 porto)
      (visited d3 porto)
      (visited d4 porto)
      (visited d5 porto)
      (visited d6 porto)
      (visited d7 porto)

      (visited d8 oslo)
      (visited d9 oslo)
      (visited d10 oslo)
      (visited d11 oslo)
      (visited d13 oslo)
      (visited d14 oslo)

      (visited d12 dubrovnik)
      (visited d15 dubrovnik)
      (visited d16 dubrovnik)
    )
  )
)
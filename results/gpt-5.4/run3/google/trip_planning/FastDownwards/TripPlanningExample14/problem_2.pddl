(define (problem trip_planning_example14_instance)
  (:domain trip_planning_example14)

  (:objects
    lyon frankfurt krakow - city
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

    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)
  )

  (:goal
    (and
      (visited d1)
      (visited d2)
      (visited d3)
      (visited d4)
      (visited d5)
      (visited d6)
      (visited d7)
      (visited d8)
      (visited d9)
      (visited d10)

      (at lyon d1)
      (at lyon d2)
      (at lyon d3)
      (at lyon d4)
      (at lyon d5)

      (at frankfurt d6)
      (at frankfurt d7)

      (at krakow d8)
      (at krakow d9)
      (at krakow d10)
    )
  )
)
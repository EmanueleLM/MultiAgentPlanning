(define (problem trip_planning_example40_problem)
  (:domain trip_planning_example40)

  (:objects
    traveler_1 - traveler
    oslo reykjavik manchester - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    (direct oslo reykjavik)
    (direct reykjavik oslo)
    (direct manchester oslo)
    (direct oslo manchester)

    (current_day d1)
  )

  (:goal
    (and
      (current_day d8)
      (located_on manchester d1)
      (located_on manchester d2)
      (located_on oslo d3)
      (located_on oslo d4)
      (located_on oslo d5)
      (located_on oslo d6)
      (located_on reykjavik d7)
      (located_on reykjavik d8)
    )
  )
)
(define (problem trip_planning_example40_problem)
  (:domain trip_planning_example40)

  (:objects
    traveler_1 - traveler
    oslo reykjavik manchester - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)

    (direct oslo reykjavik)
    (direct reykjavik oslo)
    (direct manchester oslo)
    (direct oslo manchester)

    (current_day day_1)
  )

  (:goal
    (and
      (current_day day_8)
      (located_on manchester day_1)
      (located_on manchester day_2)
      (located_on oslo day_3)
      (located_on oslo day_4)
      (located_on oslo day_5)
      (located_on oslo day_6)
      (located_on reykjavik day_7)
      (located_on reykjavik day_8)
    )
  )
)
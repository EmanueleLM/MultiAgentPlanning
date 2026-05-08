(define (problem trip_planning_example37_problem)
  (:domain trip_planning_example37)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (current day_1)
    (at reykjavik)
    (visited reykjavik day_1)
  )

  (:goal
    (and
      (current day_10)
      (visited reykjavik day_1)
      (visited reykjavik day_2)
      (visited reykjavik day_3)
      (visited reykjavik day_4)
      (visited reykjavik day_5)
      (visited reykjavik day_6)
      (visited milan day_7)
      (visited milan day_8)
      (visited porto day_9)
      (visited porto day_10)
    )
  )
)
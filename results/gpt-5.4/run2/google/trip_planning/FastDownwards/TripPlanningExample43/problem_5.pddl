(define (problem trip_planning_example43_problem)
  (:domain trip_planning_example43)

  (:objects
    dublin porto venice - city
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

    (direct_flight dublin porto)
    (direct_flight porto dublin)
    (direct_flight venice dublin)
    (direct_flight dublin venice)

    (friends_window d1)
    (friends_window d2)
    (friends_window d3)
    (friends_window d4)
  )

  (:goal
    (and
      (current d10)
      (met_friends)

      (visited_on venice d1)
      (visited_on venice d2)
      (visited_on venice d3)
      (visited_on venice d4)

      (visited_on porto d7)
      (visited_on porto d8)
      (visited_on porto d9)
      (visited_on porto d10)

      (visited_on dublin d4)
      (visited_on dublin d5)
      (visited_on dublin d6)
      (visited_on dublin d7)
    )
  )
)
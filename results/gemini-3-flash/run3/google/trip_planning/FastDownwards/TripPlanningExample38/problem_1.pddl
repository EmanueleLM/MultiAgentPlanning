(define (problem trip_planning_example_38)
  (:domain trip_planning)
  (:objects
    geneva madrid venice - city
    d0 d1 d2 d3 d4 d5 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    (available_to_start)
    (is_d0 d0)
    (next d0 d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (flight geneva madrid)
    (flight madrid geneva)
    (flight madrid venice)
    (flight venice madrid)
    (visited_count geneva n0)
    (visited_count madrid n0)
    (visited_count venice n0)
  )
  (:goal
    (and
      (visited_count geneva n2)
      (visited_count madrid n3)
      (visited_count venice n2)
      (visited_on venice d4)
      (visited_on venice d5)
      (at venice d5)
    )
  )
)
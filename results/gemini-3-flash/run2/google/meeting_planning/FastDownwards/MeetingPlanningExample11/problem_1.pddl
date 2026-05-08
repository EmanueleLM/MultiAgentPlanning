(define (problem meeting_problem_11)
  (:domain meeting_planning_example_11)
  (:objects
    nob_hill sunset_district - location
    t0900 t0925 t1400 t1515 t2030 - time_point
  )
  (:init
    (at_location nob_hill)
    (time_at t0900)
    (next t0900 t0925)
    (next t0925 t1400)
    (next t1400 t1515)
    (next t1515 t2030)
  )
  (:goal
    (met_carol)
  )
)
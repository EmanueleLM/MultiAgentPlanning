(define (problem meeting_planning_example_44)
  (:domain meeting_planning)
  (:objects
    pacific_heights fishermans_wharf - location
    betty - person
    t0900 t0913 t1058 - time
  )
  (:init
    (at pacific_heights)
    (time_at t0900)
    (person_at betty fishermans_wharf)
    (available_at betty t0913)
    (available_at betty t1058)
    (next_13_min t0900 t0913)
    (next_105_min t0913 t1058)
    (connected_13 pacific_heights fishermans_wharf)
    (connected_12 fishermans_wharf pacific_heights)
  )
  (:goal
    (met betty)
  )
)
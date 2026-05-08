(define (problem meeting_planning_example_39)
  (:domain meeting_planning)
  (:objects
    fishermans_wharf nob_hill - location
    t0900 t1645 t1845 t2145 - time_point
  )
  (:init
    (at fishermans_wharf)
    (current_time t0900)
    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)
    (next_time t0900 t1645)
    (next_time t1645 t1845)
    (next_time t1845 t2145)
    (is_meeting t1645 t1845)
  )
  (:goal
    (met_stephanie)
  )
)
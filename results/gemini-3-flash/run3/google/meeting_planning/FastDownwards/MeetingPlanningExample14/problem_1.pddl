(define (problem meeting_planning_example14)
  (:domain meeting_planning)
  (:objects
    me mary - person
    nob_hill marina_district - location
    t0900 t0911 t2000 t2200 t2212 - timepoint
  )

  (:init
    ;; Starting conditions: 9:00 AM at Nob Hill
    (at me nob_hill)
    (time_at t0900)
    
    ;; Mary's location constraint: At Marina for the meeting window
    (at mary marina_district)
  )

  (:goal
    ;; Objective: Meet Mary (which requires being at the location for the specified duration)
    (has_met mary)
  )
)
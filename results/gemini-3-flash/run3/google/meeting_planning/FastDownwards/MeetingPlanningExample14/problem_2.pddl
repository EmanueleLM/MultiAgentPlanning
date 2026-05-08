(define (problem meeting_planning_example14)
  (:domain meeting_planning)
  (:objects
    me mary - person
  )

  (:init
    ;; Starting conditions: 9:00 AM at Nob Hill
    (at me nob_hill)
    (time_at t0900)
    
    ;; Mary's location constraint for the meeting window
    (at mary marina_district)
  )

  (:goal
    ;; Objective: Meet Mary (specifically 'me' meeting 'mary')
    (has_met me mary)
  )
)
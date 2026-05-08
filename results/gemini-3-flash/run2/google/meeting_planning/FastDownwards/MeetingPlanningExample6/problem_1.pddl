(define (problem meeting_planning_example_6)
  (:domain meeting_planning)
  (:objects
    me kenneth - person
    fishermans_wharf nob_hill - location
    t0900 t0911 t1415 t1545 - time_point
  )

  (:init
    ;; Starting conditions
    (at_person me fishermans_wharf)
    (time_at t0900)

    ;; Connectivity and Travel constraints (11 minutes)
    ;; Travel from Fisherman's Wharf to Nob Hill
    (can_move t0900 t0911 fishermans_wharf nob_hill)
    
    ;; Wait constraints
    ;; Waiting at Nob Hill until Kenneth arrives at 14:15 (2:15 PM)
    (can_wait t0911 t1415)

    ;; Meeting constraints (90 minutes minimum)
    ;; Kenneth is at Nob Hill from 14:15 to 19:45. 
    ;; A meeting from 14:15 to 15:45 is exactly 90 minutes.
    (can_meet t1415 t1545 kenneth nob_hill)
  )

  (:goal
    (met kenneth)
  )
)
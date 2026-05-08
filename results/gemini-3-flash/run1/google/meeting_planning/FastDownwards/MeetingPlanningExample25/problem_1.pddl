(define (problem meeting_planning_example_25)
  (:domain meeting_planning)
  (:objects
    visitor david - person
    golden_gate_park chinatown - location
    t0900 t0923 t1600 t1745 - timepoint
  )
  (:init
    ;; Starting state: Visitor at Golden Gate Park at 9:00 AM
    (at visitor golden_gate_park)
    (time_is t0900)

    ;; Travel time from Golden Gate Park to Chinatown is 23 minutes.
    ;; 9:00 AM + 23 minutes = 9:23 AM.
    (connected golden_gate_park chinatown t0900 t0923)

    ;; Wait from arrival in Chinatown (9:23 AM) until David arrives (4:00 PM).
    (waiting_possible t0923 t1600)

    ;; David is at Chinatown from 4:00 PM to 9:45 PM. 
    ;; A 105-minute meeting starting at 4:00 PM (16:00) ends at 5:45 PM (17:45).
    ;; This interval is within David's availability.
    (available david chinatown t1600 t1745)
  )
  (:goal
    ;; Meet David (the only friend mentioned).
    (met david)
  )
)
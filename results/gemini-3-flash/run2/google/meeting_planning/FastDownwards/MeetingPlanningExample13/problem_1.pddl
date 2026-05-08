(define (problem meeting_planning_example_13)
  (:domain meeting_planning)
  (:objects
    presidio north_beach - location
    t0900 t0918 t1845 t2000 t2017 - time
    betty - person
  )
  (:init
    ;; Starting state: arrive at Presidio at 9:00 AM
    (at_loc presidio)
    (at_time t0900)

    ;; Movement constraints:
    ;; Presidio to North Beach takes 18 minutes (09:00 -> 09:18)
    (can_move presidio north_beach t0900 t0918)
    ;; North Beach to Presidio takes 17 minutes (for completeness, e.g., after meeting)
    (can_move north_beach presidio t2000 t2017)

    ;; Feasible wait constraint: 
    ;; Wait at North Beach from arrival (09:18) until Betty arrives (18:45)
    (can_wait north_beach t0918 t1845)

    ;; Meeting constraint:
    ;; Betty at North Beach from 6:45 PM (18:45) to 10:00 PM.
    ;; Minimum meeting duration is 75 minutes. 
    ;; 18:45 + 75 minutes = 20:00 (8:00 PM).
    ;; This is within Betty's window (18:45 - 22:00).
    (can_meet betty north_beach t1845 t2000)
  )
  (:goal (met betty))
)
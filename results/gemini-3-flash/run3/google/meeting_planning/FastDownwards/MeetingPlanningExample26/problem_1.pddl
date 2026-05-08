(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    richmond_district presidio - location
    t0900 t0907 t1315 t1500 - time
    sarah - person
  )
  (:init
    ;; Initial state: Agent starts at Richmond District at 9:00 AM.
    (at richmond_district)
    (clock t0900)

    ;; Feasible travel: Richmond District to Presidio takes 7 minutes.
    (can_travel richmond_district presidio t0900 t0907)

    ;; Feasible waiting: Waiting at Presidio until Sarah arrives at 1:15 PM (13:15).
    (can_wait t0907 t1315)

    ;; Feasible meeting: Sarah is at Presidio starting at 1:15 PM (13:15).
    ;; Meeting for the minimum required 105 minutes ends at 3:00 PM (15:00).
    ;; This is within her 1:15 PM to 3:15 PM window.
    (can_meet sarah presidio t1315 t1500)
  )
  (:goal
    ;; The goal is to meet the friend (Sarah).
    (met sarah)
  )
)
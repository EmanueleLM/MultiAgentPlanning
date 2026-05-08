(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    golden_gate_park chinatown - location
    t0900 t0923 t1600 t1745 - time
    david - friend
  )
  (:init
    ;; Starting state: You arrive at Golden Gate Park at 9:00 AM.
    (at_location golden_gate_park)
    (cur_time t0900)

    ;; Feasible transitions based on problem constraints:
    ;; 1. Travel from Golden Gate Park to Chinatown takes 23 minutes.
    (can_travel golden_gate_park chinatown t0900 t0923)
    
    ;; 2. Waiting at Chinatown from arrival (9:23 AM) until David's arrival (4:00 PM / 16:00).
    (can_wait chinatown t0923 t1600)
    
    ;; 3. David is at Chinatown from 4:00 PM to 9:45 PM.
    ;; Meeting David for the minimum of 105 minutes (1h 45m) starting at 4:00 PM (16:00) 
    ;; would end at 5:45 PM (17:45), which is well within his window.
    (friend_at david chinatown t1600 t1745)
  )
  (:goal
    ;; The goal is to meet the friends listed (David).
    (met david)
  )
)
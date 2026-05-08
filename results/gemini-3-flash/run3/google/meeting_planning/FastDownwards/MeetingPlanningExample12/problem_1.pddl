(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    north_beach alamo_square - location
    t0900 t0916 t1744 t1800 t1930 t1945 t2000 t2130 t2145 - time
    barbara - person
  )
  (:init
    (at north_beach)
    (current_time t0900)
    
    ;; Timeline chain for waiting
    (next t0900 t0916)
    (next t0916 t1744)
    (next t1744 t1800)
    (next t1800 t1930)
    (next t1930 t1945)
    (next t1945 t2000)
    (next t2000 t2130)
    (next t2130 t2145)
    
    ;; Travel options: NB to AS takes 16 minutes
    (can_move north_beach alamo_square t0900 t0916)
    (can_move north_beach alamo_square t1744 t1800)
    
    ;; Travel options: AS to NB takes 15 minutes
    (can_move alamo_square north_beach t1930 t1945)
    (can_move alamo_square north_beach t2130 t2145)
    
    ;; Meeting constraints: Barbara at Alamo Square from 6:00PM (t1800) to 9:30PM (t2130)
    ;; A meeting requires at least 90 minutes.
    (can_meet barbara alamo_square t1800 t1930)
    (can_meet barbara alamo_square t2000 t2130)
  )
  (:goal
    (met barbara)
  )
)
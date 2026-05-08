(define (problem meet_friends_in_sf)
  (:domain meeting_planning)
  (:objects
    union_square north_beach - location
    t_0900 t_0910 t_2135 t_2145 t_2230 - time
    margaret - friend
  )
  (:init
    (at union_square)
    (time_at t_0900)
    
    ;; Waiting options:
    ;; 1. Wait at Union Square from arrival until the latest departure time for the meeting.
    (can_wait union_square t_0900 t_2135)
    ;; 2. Wait at North Beach if arriving early.
    (can_wait north_beach t_0910 t_2145)
    
    ;; Travel options:
    ;; 1. Travel from Union Square to North Beach immediately (10 minutes).
    (can_travel union_square north_beach t_0900 t_0910)
    ;; 2. Travel from Union Square to North Beach just in time for the meeting (10 minutes).
    (can_travel union_square north_beach t_2135 t_2145)
    
    ;; Meeting options:
    ;; Margaret is at North Beach from 9:45 PM to 10:30 PM (exactly 45 minutes).
    ;; Meeting her for the minimum 45 minutes requires occupying this entire window.
    (can_meet margaret north_beach t_2145 t_2230)
  )
  (:goal (has_met margaret))
)
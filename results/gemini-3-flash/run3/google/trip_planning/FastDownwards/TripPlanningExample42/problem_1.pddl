(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Starting conditions
    (at paris)
    (current_day d1)
    
    ;; City counters initialized to 0
    (stay_count paris n0)
    (stay_count nice n0)
    (stay_count mykonos n0)
    
    ;; Identity and properties
    (is_paris paris)
    
    ;; Time and Count sequences
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    
    ;; Friend window constraints (inclusive)
    (in_friend_window d1)
    (in_friend_window d2)
    (in_friend_window d3)
    (in_friend_window d4)
    
    ;; Post-friend window days
    (not_in_friend_window d5)
    (not_in_friend_window d6)
    (not_in_friend_window d7)
    (not_in_friend_window d8)
    (not_in_friend_window d9)
    (not_in_friend_window d10)
    (not_in_friend_window d11)
    
    ;; Available direct flights
    (can_fly paris nice)
    (can_fly nice paris)
    (can_fly nice mykonos)
    (can_fly mykonos nice)
  )
  (:goal (and
    ;; Required stay durations: 4 in Paris, 5 in Nice, 4 in Mykonos
    (stay_count paris n4)
    (stay_count nice n5)
    (stay_count mykonos n4)
    ;; Trip must span 11 days (processing completed through d11)
    (current_day d12)
  ))
)
(define (problem trip_planning_example_6_problem)
  (:domain trip_planning_example_6)
  (:objects
    berlin munich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    n0 n1 n2 n3 n4 - count
  )
  (:init
    ;; Starting state: At Berlin on Day 1
    (at berlin d1)
    (visited berlin d1)
    
    ;; Initial counts: Berlin starts at 1, others at 0
    (city_count_at berlin n1)
    (city_count_at munich n0)
    (city_count_at dubrovnik n0)
    
    ;; Day chronology
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    
    ;; Value progression for counting visits
    (next_val n0 n1)
    (next_val n1 n2)
    (next_val n2 n3)
    (next_val n3 n4)
    
    ;; Flight connectivity
    (can_fly munich dubrovnik)
    (can_fly dubrovnik munich)
    (can_fly berlin munich)
    (can_fly munich berlin)
  )
  (:goal
    (and
      ;; Total visit counts for each city
      (city_count_at berlin n4)
      (city_count_at munich n3)
      (city_count_at dubrovnik n3)
      
      ;; Hard constraints: Berlin conference on Day 1 and Day 4
      (visited berlin d1)
      (visited berlin d4)
      
      ;; Ensure trip covers the 8-day span
      (trip_complete)
    )
  )
)
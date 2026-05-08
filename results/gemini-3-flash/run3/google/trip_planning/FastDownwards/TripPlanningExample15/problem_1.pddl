(define (problem trip_planning_example15_problem)
  (:domain trip_planning_example15)
  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 - val
  )
  (:init
    ;; Timeline sequencing
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    
    ;; Day counters sequencing
    (next_val v0 v1) (next_val v1 v2) (next_val v2 v3) (next_val v3 v4)
    (next_val v4 v5) (next_val v5 v6) (next_val v6 v7) (next_val v7 v8)
    (next_val v8 v9) (next_val v9 v10) (next_val v10 v11)
    
    ;; Initial city counts
    (count berlin v0)
    (count porto v0)
    (count krakow v0)
    
    ;; Direct flight connectivity
    (connected berlin porto) (connected porto berlin)
    (connected krakow berlin) (connected berlin krakow)
    
    ;; Starting conditions
    (is_d1 d1)
  )
  (:goal
    (and
      ;; Total days required for each city
      (count berlin v6)
      (count porto v2)
      (count krakow v5)
      
      ;; Wedding condition
      (at porto d10)
      (at porto d11)
      
      ;; Trip completion
      (current_day d11)
    )
  )
)
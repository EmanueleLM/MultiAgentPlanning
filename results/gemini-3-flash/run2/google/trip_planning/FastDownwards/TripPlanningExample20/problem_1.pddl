(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    istanbul budapest dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
    count_0 count_1 count_2 count_3 count_4 count_5 count_6 - count
  )

  (:init
    ;; Starting point is Dubrovnik to allow visiting all cities given flight constraints.
    (at dubrovnik)
    (current_day day_1)
    
    ;; All city stay counters initialized to 0.
    (day_count istanbul count_0)
    (day_count budapest count_0)
    (day_count dubrovnik count_0)
    
    ;; Temporal day sequence for a 12-day trip (reaching day_13 marks completion).
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    
    ;; Integer sequence for counting stay days.
    (next_val count_0 count_1)
    (next_val count_1 count_2)
    (next_val count_2 count_3)
    (next_val count_3 count_4)
    (next_val count_4 count_5)
    (next_val count_5 count_6)
    
    ;; Flight connections.
    (can_fly istanbul budapest)
    (can_fly budapest istanbul)
    (can_fly dubrovnik istanbul)
  )

  (:goal (and
    ;; Requirements: Istanbul 5 days, Budapest 6 days, Dubrovnik 3 days.
    (day_count istanbul count_5)
    (day_count budapest count_6)
    (day_count dubrovnik count_3)
    ;; Total trip duration of 12 days.
    (current_day day_13)
  ))
)
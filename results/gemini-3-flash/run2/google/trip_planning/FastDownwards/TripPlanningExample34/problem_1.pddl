(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    frankfurt florence valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
    count_0 count_1 count_2 count_3 count_4 count_5 - count
  )
  (:init
    (not_started)
    (current_day day_1)
    
    ;; Initialize all city stay counters to zero.
    (count frankfurt count_0)
    (count florence count_0)
    (count valencia count_0)
    
    ;; Timeline definition (9 days in total, so d10 marks the end).
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    
    ;; Counting sequence definition.
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
    
    ;; Flight connectivity (bidirectional direct flights).
    (connected frankfurt florence)
    (connected florence frankfurt)
    (connected valencia frankfurt)
    (connected frankfurt valencia)
  )
  (:goal
    (and
      ;; Total days spent in each city.
      (count frankfurt count_5)
      (count florence count_4)
      (count valencia count_2)
      
      ;; Specific temporal constraint for Valencia relatives.
      (day_at day_1 valencia)
      (day_at day_2 valencia)
      
      ;; Ensure the timeline of exactly 9 days has been exhausted.
      (current_day day_10)
    )
  )
)
(define (problem trip_planning_problem_34)
  (:domain trip_planning_example_34)
  (:objects
    frankfurt florence valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
    c0 c1 c2 c3 c4 c5 - level
  )
  (:init
    (trip_not_started)
    (current_day day_1)
    
    (stay_count frankfurt c0)
    (stay_count florence c0)
    (stay_count valencia c0)
    
    (next_day_link day_1 day_2)
    (next_day_link day_2 day_3)
    (next_day_link day_3 day_4)
    (next_day_link day_4 day_5)
    (next_day_link day_5 day_6)
    (next_day_link day_6 day_7)
    (next_day_link day_7 day_8)
    (next_day_link day_8 day_9)
    
    (next_level c0 c1)
    (next_level c1 c2)
    (next_level c2 c3)
    (next_level c3 c4)
    (next_level c4 c5)
    
    (connected frankfurt florence)
    (connected florence frankfurt)
    (connected valencia frankfurt)
    (connected frankfurt valencia)
  )
  (:goal
    (and
      (stay_count frankfurt c5)
      (stay_count florence c4)
      (stay_count valencia c2)
      (visited valencia day_1)
      (visited valencia day_2)
    )
  )
)
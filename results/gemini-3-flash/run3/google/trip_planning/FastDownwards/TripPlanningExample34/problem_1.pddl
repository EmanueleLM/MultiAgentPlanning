(define (problem trip_plan_9days)
  (:domain trip_planner)
  (:objects
    frankfurt florence valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
    count_0 count_1 count_2 count_3 count_4 count_5 - count_step
  )
  (:init
    ;; Starting configuration on Day 1
    (at_city valencia)
    (day_at day_1)
    (city_count valencia count_1)
    (city_count frankfurt count_0)
    (city_count florence count_0)
    (visited_day valencia day_1)

    ;; Temporal succession
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)

    ;; Counter progression
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)

    ;; Direct flight network
    (flight frankfurt florence)
    (flight florence frankfurt)
    (flight valencia frankfurt)
    (flight frankfurt valencia)
  )
  (:goal
    (and
      ;; Required durations in each city
      (city_count frankfurt count_5)
      (city_count florence count_4)
      (city_count valencia count_2)
      
      ;; Specific relative visit requirement (must be in Valencia on Day 1 and Day 2)
      (visited_day valencia day_1)
      (visited_day valencia day_2)
      
      ;; Complete the 9-day plan
      (day_at day_9)
    )
  )
)
(define (problem trip_planning_example_36)
  (:domain trip_planning)
  (:objects
    florence munich warsaw - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
    count_0 count_1 count_2 count_3 count_4 count_5 count_6 count_7 - count
  )
  (:init
    ;; Starting location and day
    (at_city florence)
    (current_day day_1)

    ;; Initial stay counts for all cities
    (stay_count florence count_0)
    (stay_count munich count_0)
    (stay_count warsaw count_0)

    ;; Direct flights between cities as inferred from the prompt
    (can_fly florence munich)
    (can_fly munich warsaw)

    ;; Temporal sequence of days
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

    ;; Stay count progression
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
    (next_count count_5 count_6)
    (next_count count_6 count_7)
  )
  (:goal (and
    ;; Requirements for stay duration in each city
    (stay_count florence count_2)
    (stay_count munich count_6)
    (stay_count warsaw count_7)
  ))
)
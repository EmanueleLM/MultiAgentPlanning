(define (problem trip_planning_example_29)
  (:domain trip_planning)
  (:objects
    frankfurt krakow dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
    count_0 count_1 count_2 count_3 count_4 count_5 count_6 count_7 count_8 count_9 count_10 - count
  )
  (:init
    (ready_to_start)
    (current_day day_1)

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

    ;; Stay count mapping
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
    (next_count count_5 count_6)
    (next_count count_6 count_7)
    (next_count count_7 count_8)
    (next_count count_8 count_9)
    (next_count count_9 count_10)

    ;; Initial stay counts
    (visit_count frankfurt count_0)
    (visit_count krakow count_0)
    (visit_count dubrovnik count_0)

    ;; Direct flight connections
    (flight_connection frankfurt krakow)
    (flight_connection krakow frankfurt)
    (flight_connection frankfurt dubrovnik)
    (flight_connection dubrovnik frankfurt)
  )
  (:goal
    (and
      ;; Total trip duration of 10 days is reached when current_day is day_11
      (current_day day_11)
      
      ;; Stay requirements (Total units 12, made possible by 2 fly actions sharing 2 days)
      (visit_count dubrovnik count_7)
      (visit_count frankfurt count_3)
      (visit_count krakow count_2)
      
      ;; Wedding requirement: Krakow on day 9 and day 10
      (visited_day krakow day_9)
      (visited_day krakow day_10)
    )
  )
)
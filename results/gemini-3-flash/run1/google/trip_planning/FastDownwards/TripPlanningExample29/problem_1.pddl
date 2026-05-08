(define (problem trip_planning_example_29)
  (:domain trip_planning)
  (:objects
    frankfurt krakow dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    ;; Set the first day
    (is_day1 day1)
    (ready_to_start)

    ;; Temporal sequence of days
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    ;; Count sequence for tracking stay durations
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)

    ;; Initial visit counts for all cities
    (city_visit_count frankfurt n0)
    (city_visit_count krakow n0)
    (city_visit_count dubrovnik n0)

    ;; Direct flight connections (bidirectional)
    (flight frankfurt krakow)
    (flight krakow frankfurt)
    (flight dubrovnik frankfurt)
    (flight frankfurt dubrovnik)
  )
  (:goal
    (and
      ;; 10 days in total are accounted for by reaching the end of the day sequence
      (at_city_day krakow day10)
      
      ;; Wedding requirement: Krakow on day 9 and day 10
      (at_city_day krakow day9)
      (at_city_day krakow day10)
      
      ;; Duration requirements: Krakow (2), Dubrovnik (7), Frankfurt (3)
      ;; Note: Total days required (12) exceeds trip duration (10)
      (city_visit_count krakow n2)
      (city_visit_count dubrovnik n7)
      (city_visit_count frankfurt n3)
    )
  )
)
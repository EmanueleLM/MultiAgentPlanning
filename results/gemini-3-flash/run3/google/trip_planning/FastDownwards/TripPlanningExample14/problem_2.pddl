(define (problem trip_planning_example_14)
  (:domain trip_planning)
  (:objects
    lyon frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    count0 count1 count2 count3 count4 count5 count6 count7 count8 count9 count10 - count
  )
  (:init
    ;; Starting conditions: start in Lyon on Day 1 with zero days counted.
    (at lyon)
    (current_day day1)
    (city_count lyon count0)
    (city_count frankfurt count0)
    (city_count krakow count0)

    ;; Calendar structure
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    ;; Counting structure
    (next_count count0 count1)
    (next_count count1 count2)
    (next_count count2 count3)
    (next_count count3 count4)
    (next_count count4 count5)
    (next_count count5 count6)
    (next_count count6 count7)
    (next_count count7 count8)
    (next_count count8 count9)
    (next_count count9 count10)

    ;; Flight routes
    (flight lyon frankfurt)
    (flight frankfurt lyon)
    (flight frankfurt krakow)
    (flight krakow frankfurt)
  )
  (:goal
    (and
      ;; Visit durations
      (city_count lyon count7)
      (city_count frankfurt count2)
      (city_count krakow count3)
      
      ;; Specific show timing constraints
      (visited krakow day8)
      (visited krakow day9)
      (visited krakow day10)
    )
  )
)
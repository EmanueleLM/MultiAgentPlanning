(define (problem trip_planning_example_14)
  (:domain trip_planning)
  (:objects
    lyon frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    count0 count1 count2 count3 count4 count5 count6 count7 count8 count9 count10 - count
  )
  (:init
    (available)
    (city_count lyon count0)
    (city_count frankfurt count0)
    (city_count krakow count0)
    
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    
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
    
    (flight lyon frankfurt)
    (flight frankfurt lyon)
    (flight frankfurt krakow)
    (flight krakow frankfurt)
  )
  (:goal
    (and
      (city_count lyon count7)
      (city_count frankfurt count2)
      (city_count krakow count3)
      (at krakow day8)
      (at krakow day9)
      (at krakow day10)
    )
  )
)
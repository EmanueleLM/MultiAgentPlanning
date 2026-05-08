(define (problem trip_10_days)
  (:domain trip_planning)
  (:objects
    reykjavik milan porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - count
  )
  (:init
    (not_started)
    (current_day day1)
    (city_count reykjavik c0)
    (city_count milan c0)
    (city_count porto c0)
    
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)
    
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    
    (can_fly reykjavik milan)
    (can_fly milan reykjavik)
    (can_fly milan porto)
    (can_fly porto milan)
  )
  (:goal
    (and
      (city_count reykjavik c6)
      (city_count porto c2)
      (city_count milan c4)
      (visited_at porto day9)
      (visited_at porto day10)
      (current_day day11)
    )
  )
)
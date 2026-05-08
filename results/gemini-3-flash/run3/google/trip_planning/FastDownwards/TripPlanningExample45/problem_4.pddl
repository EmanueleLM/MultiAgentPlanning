(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    copenhagen lisbon florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    v0 v1 v2 v3 v4 v5 v6 v7 - count
  )
  (:init
    ;; Initial location and calendar
    (at copenhagen)
    (visited copenhagen)
    (current_day day1)
    
    ;; Initial stay counts: Copenhagen starts with Day 1 as its 1st day.
    ;; Lisbon and Florence are currently unvisited (count v0).
    (stay_count copenhagen v1)
    (stay_count lisbon v0)
    (stay_count florence v0)

    ;; Flight connectivity
    (can_fly copenhagen lisbon)
    (can_fly lisbon copenhagen)
    (can_fly lisbon florence)
    (can_fly florence lisbon)

    ;; Conference schedule
    (conference_at copenhagen day1)
    (conference_at copenhagen day7)

    ;; Calendar succession
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
    (next_day day11 day12)
    (next_day day12 day13)
    (next_day day13 day14)
    (next_day day14 day15)
    (next_day day15 day16)

    ;; Counter succession
    (next_count v0 v1)
    (next_count v1 v2)
    (next_count v2 v3)
    (next_count v3 v4)
    (next_count v4 v5)
    (next_count v5 v6)
    (next_count v6 v7)
  )
  (:goal
    (and
      ;; Attend conferences in Copenhagen
      (conference_done day1)
      (conference_done day7)
      
      ;; Stay requirements (Total stay-days: 18 across 16 calendar days via 2 travel-day overlaps)
      (stay_count copenhagen v7)
      (stay_count lisbon v7)
      (stay_count florence v4)
      
      ;; Ensure the trip ends at the final day of the timeline
      (current_day day16)
    )
  )
)
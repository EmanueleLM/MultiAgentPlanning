(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    copenhagen lisbon florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    v0 v1 v2 v3 v4 v5 v6 v7 - count
    unvisited staying finished - status
  )
  (:init
    ;; Starting conditions: At Copenhagen on Day 1
    (at copenhagen)
    (current_day day1)
    
    ;; Initial stay counts: Copenhagen starts with Day 1 as its 1st day.
    (stay_count copenhagen v1)
    (stay_count lisbon v0)
    (stay_count florence v0)

    ;; City statuses to enforce contiguous visits and track travel
    (status copenhagen staying)
    (status lisbon unvisited)
    (status florence unvisited)

    ;; Flight network (bidirectional)
    (flight copenhagen lisbon)
    (flight lisbon copenhagen)
    (flight lisbon florence)
    (flight florence lisbon)

    ;; Calendar succession (Day 1 to Day 16)
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

    ;; Counter succession (0 to 7)
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
      ;; Conferences in Copenhagen on Day 1 and Day 7
      (conf_day1_done)
      (conf_day7_done)
      
      ;; Stay requirements (Total stay-days 18 across 16 calendar days)
      (stay_count copenhagen v7)
      (stay_count lisbon v7)
      (stay_count florence v4)
      
      ;; Ensure the trip is completed within the timeline
      (current_day day16)
    )
  )
)
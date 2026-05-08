(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    copenhagen lisbon florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 - count
  )
  (:init
    ;; Starting conditions: At Copenhagen on Day 1
    (at copenhagen day1)
    
    ;; Initial stay counts: Copenhagen starts at 1, others at 0
    (count_at copenhagen v1)
    (count_at lisbon v0)
    (count_at florence v0)

    ;; Flight network (direct connections are bidirectional)
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

    ;; Counter succession (0 to 16)
    (next_count v0 v1)
    (next_count v1 v2)
    (next_count v2 v3)
    (next_count v3 v4)
    (next_count v4 v5)
    (next_count v5 v6)
    (next_count v6 v7)
    (next_count v7 v8)
    (next_count v8 v9)
    (next_count v9 v10)
    (next_count v10 v11)
    (next_count v11 v12)
    (next_count v12 v13)
    (next_count v13 v14)
    (next_count v14 v15)
    (next_count v15 v16)
  )
  (:goal
    (and
      ;; Explicit temporal constraint: Conference in Copenhagen on Day 7
      (at copenhagen day7)
      
      ;; Stay duration requirements:
      ;; Lisbon: 7 days
      ;; Florence: 4 days
      ;; Copenhagen: 7 days
      ;; Note: Total stay days requested (18) exceeds trip length (16)
      (count_at copenhagen v7)
      (count_at lisbon v7)
      (count_at florence v4)
    )
  )
)
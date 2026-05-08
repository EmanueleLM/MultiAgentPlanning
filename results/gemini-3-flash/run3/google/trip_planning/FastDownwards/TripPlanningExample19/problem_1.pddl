(define (problem trip_planning_example_19_problem)
  (:domain trip_planning_example_19)
  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )

  (:init
    ;; Starting position and initial stay counts
    (at nice day1)
    (stay_count nice c0)
    (stay_count brussels c0)
    (stay_count valencia c0)

    ;; Temporal succession (9 days total)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)

    ;; Counting succession
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    ;; Direct flight connectivity
    (conn brussels valencia)
    (conn valencia brussels)
    (conn nice brussels)
    (conn brussels nice)
  )

  (:goal
    (and
      ;; 6 days in Nice, specifically between Day 1 and Day 6 for friends
      (recorded nice day1)
      (recorded nice day2)
      (recorded nice day3)
      (recorded nice day4)
      (recorded nice day5)
      (recorded nice day6)
      (stay_count nice c6)

      ;; 2 days in Brussels
      (stay_count brussels c2)

      ;; 3 days in Valencia
      (stay_count valencia c3)
    )
  )
)
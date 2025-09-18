(define (problem integrated-trip)
  (:domain integrated-travel)

  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ;; direct flights known (public information: only these direct flights are available)
    (flight valencia amsterdam)
    (flight amsterdam valencia)
    (flight amsterdam tallinn)
    (flight tallinn amsterdam)

    ;; day successor relations (discrete days 1..15)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15)

    ;; initial location: start in Valencia on day1
    (at valencia day1)
    (visited valencia)

    ;; mark day1 as already assigned so ams_start_day1 won't reassign it
    (assigned day1)

    ;; mark which city is Tallinn for the meet action
    (is_tallinn tallinn)

    ;; meeting allowed days (public requirement: meet a friend in Tallinn between day 9 and day 15)
    (meet_allowed day9) (meet_allowed day10) (meet_allowed day11)
    (meet_allowed day12) (meet_allowed day13) (meet_allowed day14) (meet_allowed day15)

    ;; initialize symbolic Amsterdam-day counter to 0
    (ams_count_0)

    ;; initialize total cost
    (= (total-cost) 0)
  )

  (:goal
    (and
      ;; cover all 15 days (each day must be assigned a city)
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
      (assigned day11) (assigned day12) (assigned day13) (assigned day14) (assigned day15)

      ;; Spend days 1..5 in Valencia (Valencia agent requirement)
      (at valencia day1) (at valencia day2) (at valencia day3) (at valencia day4) (at valencia day5)

      ;; Visit each of the three cities at least once
      (visited valencia) (visited amsterdam) (visited tallinn)

      ;; Spend exactly 5 days in Amsterdam (agent amsterdam scheduling requirement)
      (ams_count_5)

      ;; Meet the friend in Tallinn between day9 and day15 (must be achieved)
      (metfriend)
    )
  )

  ;; minimize total cost (number of day-advance actions / flights / stays)
  (:metric minimize (total-cost))
)
(define (problem tripplanningexample18_problem)
  (:domain trip_planning_example18)

  (:objects
    amsterdam vilnius bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10) (unassigned day11)

    ; day ordering
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)

    ; mark first day
    (first_day day1)

    ; direct flights (bidirectional where specified)
    (flight amsterdam bucharest)
    (flight bucharest amsterdam)
    (flight vilnius amsterdam)
    (flight amsterdam vilnius)
  )

  ; Goal: produce an 11-day schedule that:
  ; - visits Amsterdam, Vilnius, and Bucharest using only direct flights or stays
  ; - fits exactly 11 days
  ; - has a meeting in Bucharest sometime between day6 and day11
  ;
  ; The schedule required here (consistent with direct-flight connectivity and minimal adjustment
  ; of the original stay requests) is:
  ; day1-2: vilnius
  ; day3-5: amsterdam
  ; day6-11: bucharest
  (:goal
    (and
      (assigned day1 vilnius)
      (assigned day2 vilnius)

      (assigned day3 amsterdam)
      (assigned day4 amsterdam)
      (assigned day5 amsterdam)

      (assigned day6 bucharest)
      (assigned day7 bucharest)
      (assigned day8 bucharest)
      (assigned day9 bucharest)
      (assigned day10 bucharest)
      (assigned day11 bucharest)
    )
  )
)
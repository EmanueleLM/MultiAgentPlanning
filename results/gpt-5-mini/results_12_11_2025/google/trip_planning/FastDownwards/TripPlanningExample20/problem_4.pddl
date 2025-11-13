(define (problem trip_planning_example20-problem)
  :domain trip_planning_example20
  :objects
    istanbul budapest dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  :init
    ;; start location and initial day
    (at dubrovnik)
    (current day1)
    ;; ordered days (day1 .. day13). 12 stay-actions advance from day1 to day13.
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    ;; allowed directed flights (static)
    (can_fly dubrovnik istanbul)
    (can_fly istanbul budapest)
    (can_fly budapest istanbul)
  :goal (and
    ;; Dubrovnik: days 1-3 (3 days)
    (served dubrovnik day1)
    (served dubrovnik day2)
    (served dubrovnik day3)
    ;; Istanbul: days 4-8 (5 days)
    (served istanbul day4)
    (served istanbul day5)
    (served istanbul day6)
    (served istanbul day7)
    (served istanbul day8)
    ;; Budapest: days 9-12 (4 days)
    (served budapest day9)
    (served budapest day10)
    (served budapest day11)
    (served budapest day12)
  )
)
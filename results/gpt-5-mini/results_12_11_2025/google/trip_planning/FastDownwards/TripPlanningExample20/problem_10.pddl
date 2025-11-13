(define (problem trip_planning_example20-problem)
  (:domain trip_planning_example20)
  (:objects
    istanbul budapest dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )
  (:init
    ;; start in Dubrovnik on the morning of day1
    (at dubrovnik)
    (current day1)

    ;; contiguous day progression for 12 full days: day1 -> day13 as successor chain
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

    ;; allowed directed flights (only these may be used)
    (can_fly dubrovnik istanbul)
    (can_fly istanbul budapest)
    (can_fly budapest istanbul)
  )

  (:goal (and
    ;; Enforce the chosen allocation and contiguous occupancy:
    ;; Dubrovnik: days 1-3 (3 contiguous days)
    (served dubrovnik day1)
    (served dubrovnik day2)
    (served dubrovnik day3)
    ;; Istanbul: days 4-8 (5 contiguous days)
    (served istanbul day4)
    (served istanbul day5)
    (served istanbul day6)
    (served istanbul day7)
    (served istanbul day8)
    ;; Budapest: days 9-12 (4 contiguous days)
    (served budapest day9)
    (served budapest day10)
    (served budapest day11)
    (served budapest day12)

    ;; terminal conditions: after 12 full days current is day13 and traveler is in Budapest
    (current day13)
    (at budapest)
  ))
)
(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )
  (:init
    (free day1) (free day2) (free day3) (free day4) (free day5)
    (free day6) (free day7) (free day8) (free day9) (free day10)
    (free day11) (free day12) (free day13) (free day14) (free day15)

    (flight amsterdam tallinn)
    (flight tallinn amsterdam)
    (flight valencia amsterdam)
    (flight amsterdam valencia)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15)

    (count-valencia-0)
    (count-amsterdam-0)
    (count-tallinn-0)
    (count-total-0)

    (meeting-window day9) (meeting-window day10) (meeting-window day11)
    (meeting-window day12) (meeting-window day13) (meeting-window day14)
    (meeting-window day15)

    ;; Precomputed predicates encoding feasible contiguous allocations:
    ;; These encode that there exists enough contiguous days to allocate each preferred stay if scheduled consecutively.
    (enough-days-for-valencia5)
    (enough-days-for-amsterdam5)
    (enough-days-for-tallinn7)
  )
  (:goal (and
    (count-valencia-5)
    (count-amsterdam-5)
    (count-tallinn-7)
    (count-total-15)
    (meeting-satisfied)
  ))
)
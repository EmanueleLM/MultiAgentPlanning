(define (problem trip_16days)
  (:domain trip_scheduling)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    copenhagen lisbon florence - city
  )
  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    (flight copenhagen lisbon) (flight lisbon copenhagen)
    (flight lisbon florence) (flight florence lisbon)

    (flight copenhagen copenhagen) (flight lisbon lisbon) (flight florence florence)

    (assigned day1)
    (at day1 copenhagen)
  )
  (:goal
    (and
      (assigned day1) (assigned day2) (assigned day3) (assigned day4)
      (assigned day5) (assigned day6) (assigned day7) (assigned day8)
      (assigned day9) (assigned day10) (assigned day11) (assigned day12)
      (assigned day13) (assigned day14) (assigned day15) (assigned day16)
      (at day1 copenhagen)
      (at day7 copenhagen)
    )
  )
)
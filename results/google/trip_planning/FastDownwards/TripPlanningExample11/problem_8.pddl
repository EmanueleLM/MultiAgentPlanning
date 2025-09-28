(define (problem trip-vienna-vilnius-valencia)
  (:domain trip-planning)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    (flight vienna valencia)
    (flight valencia vienna)
    (flight vienna vilnius)
    (flight vilnius vienna)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15)

    (at vienna day1)
  )

  (:goal
    (and
      (at vienna day1) (at vienna day2) (at vienna day3) (at vienna day4) (at vienna day5)
      (at vilnius day6) (at vilnius day7) (at vilnius day8) (at vilnius day9) (at vilnius day10)
      (at valencia day9) (at valencia day10) (at valencia day11) (at valencia day12) (at valencia day13) (at valencia day14) (at valencia day15)
      (at valencia day9)
      (at valencia day15)
    )
  )
)
(define (problem tripplanningexample11_problem)
  (:domain tripplanningexample11)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
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

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)
  )

  (:goal
    (and
      (occupied day1)
      (occupied day2)
      (occupied day3)
      (occupied day4)
      (occupied day5)
      (occupied day6)
      (occupied day7)
      (occupied day8)
      (occupied day9)
      (occupied day10)
      (occupied day11)
      (occupied day12)
      (occupied day13)
      (occupied day14)
      (occupied day15)

      (at valencia day9)
      (at valencia day15)

      (at vienna day1)
      (at vienna day2)
      (at vienna day3)
      (at vienna day4)
      (at vienna day5)

      (at vilnius day6)
      (at vilnius day7)
      (at vilnius day8)
      (at vilnius day10)
      (at vilnius day11)

      (at valencia day9)
      (at valencia day12)
      (at valencia day13)
      (at valencia day14)
      (at valencia day15)
    )
  )
)
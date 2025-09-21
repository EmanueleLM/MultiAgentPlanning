(define (problem integrated-trip-symbolic)
  (:domain combined-travel-symbolic)

  (:objects
    traveler - person
    valencia lyon split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    (at-person traveler valencia)
    (agent2_at valencia)

    (direct-flight valencia lyon)
    (direct-flight lyon valencia)
    (direct-flight lyon split)
    (direct-flight split lyon)

    (at-day day1)

    (span valencia day1 day6)
    (span valencia day2 day7)
    (span valencia day3 day8)
    (span valencia day4 day9)
    (span valencia day5 day10)
    (span valencia day6 day11)
    (span valencia day7 day12)
    (span valencia day8 day13)
    (span valencia day9 day14)
    (span valencia day10 day15)
    (span valencia day11 day16)
    (span valencia day12 day17)

    (span lyon day1 day7)
    (span lyon day2 day8)
    (span lyon day3 day9)
    (span lyon day4 day10)
    (span lyon day5 day11)
    (span lyon day6 day12)
    (span lyon day7 day13)
    (span lyon day8 day14)
    (span lyon day9 day15)
    (span lyon day10 day16)
    (span lyon day11 day17)

    (span split day10 day17)

    (is-show-city split)
  )

  (:goal (and
    (visited valencia)
    (visited lyon)
    (visited split)
    (attended-show)
  ))
)
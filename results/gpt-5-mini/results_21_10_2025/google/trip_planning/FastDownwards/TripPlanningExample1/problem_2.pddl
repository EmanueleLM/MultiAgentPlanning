(define (problem trip_problem)
  (:domain trip_domain)

  (:objects
    traveller - person
    riga manchester split - loc
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    (at traveller riga)
    (days day15)

    (connected riga manchester)
    (connected manchester riga)
    (connected manchester split)

    (next-day day15 day8)
    (next-day day8 day6)
    (next-day day6 day0)
  )

  (:goal
    (and
      (at traveller split)
      (days day0)
      (visited riga)
      (visited manchester)
      (visited split)
    )
  )
)
(define (problem trip_problem)
  (:domain trip_domain)

  (:objects
    traveller - person
    riga manchester split - loc
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ;; Start in Riga with full 15 days available; no city visited yet.
    (at traveller riga)
    (days day15)
  )

  ;; Goal: end in Split, have consumed all 15 days (days day0), and have visited all three cities.
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
(define (problem integrated-trip)
  (:domain integrated-travel)

  (:objects
    planner - person
    riga manchester split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    (at-person planner riga)
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

    (unassigned day1)
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)
    (unassigned day11)
    (unassigned day12)
    (unassigned day13)
    (unassigned day14)
    (unassigned day15)

    (= (split-count) 0)
    (= (manchester-count) 0)
    (= (riga-count) 0)
    (= (days-remaining) 15)
  )

  (:goal (and
    (= (split-count) 6)
    (= (manchester-count) 4)
    (= (riga-count) 7)
    (= (days-remaining) 0)
  ))
)
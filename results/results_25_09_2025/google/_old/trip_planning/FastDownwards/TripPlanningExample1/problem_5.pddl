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

    ;; Precomputed allocation targets to encode the numeric constraints as predicates
    (target-split day1)
    (target-split day2)
    (target-split day3)
    (target-split day4)
    (target-split day5)
    (target-split day6)

    (target-manchester day7)
    (target-manchester day8)
    (target-manchester day9)
    (target-manchester day10)

    (target-riga day11)
    (target-riga day12)
    (target-riga day13)
    (target-riga day14)
    (target-riga day15)

    (= (total-cost) 0)
  )

  (:goal (and
    (day-at day1 split)
    (day-at day2 split)
    (day-at day3 split)
    (day-at day4 split)
    (day-at day5 split)
    (day-at day6 split)

    (day-at day7 manchester)
    (day-at day8 manchester)
    (day-at day9 manchester)
    (day-at day10 manchester)

    (day-at day11 riga)
    (day-at day12 riga)
    (day-at day13 riga)
    (day-at day14 riga)
    (day-at day15 riga)
  ))

  (:metric minimize (total-cost))
)
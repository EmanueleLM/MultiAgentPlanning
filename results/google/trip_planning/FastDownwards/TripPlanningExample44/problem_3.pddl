(define (problem travel-17days)
  (:domain multiagent-travel)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
    rslot1 rslot2 rslot3 rslot4 rslot5 rslot6 - rslot
    lslot1 lslot2 lslot3 lslot4 lslot5 lslot6 - lslot
    zslot1 zslot2 zslot3 zslot4 zslot5 zslot6 zslot7 - zslot
  )

  (:init
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)
    (unassigned day11) (unassigned day12) (unassigned day13) (unassigned day14) (unassigned day15)
    (unassigned day16) (unassigned day17)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)
    (next day11 day12) (next day12 day13) (next day13 day14) (next day14 day15) (next day15 day16)
    (next day16 day17)

    (start day1)

    (early day1) (early day2) (early day3) (early day4) (early day5) (early day6) (early day7)
    (late day8) (late day9) (late day10) (late day11) (late day12) (late day13) (late day14)
    (late day15) (late day16) (late day17)

    (rome-slot-free rslot1) (rome-slot-free rslot2) (rome-slot-free rslot3) (rome-slot-free rslot4) (rome-slot-free rslot5) (rome-slot-free rslot6)
    (lyon-slot-free lslot1) (lyon-slot-free lslot2) (lyon-slot-free lslot3) (lyon-slot-free lslot4) (lyon-slot-free lslot5) (lyon-slot-free lslot6)
    (zurich-slot-free zslot1) (zurich-slot-free zslot2) (zurich-slot-free zslot3) (zurich-slot-free zslot4) (zurich-slot-free zslot5) (zurich-slot-free zslot6) (zurich-slot-free zslot7)
  )

  (:goal
    (and
      (not (rome-slot-free rslot1)) (not (rome-slot-free rslot2)) (not (rome-slot-free rslot3))
      (not (rome-slot-free rslot4)) (not (rome-slot-free rslot5)) (not (rome-slot-free rslot6))

      (not (lyon-slot-free lslot1)) (not (lyon-slot-free lslot2)) (not (lyon-slot-free lslot3))
      (not (lyon-slot-free lslot4)) (not (lyon-slot-free lslot5)) (not (lyon-slot-free lslot6))

      (not (zurich-slot-free zslot1)) (not (zurich-slot-free zslot2)) (not (zurich-slot-free zslot3))
      (not (zurich-slot-free zslot4)) (not (zurich-slot-free zslot5)) (not (zurich-slot-free zslot6)) (not (zurich-slot-free zslot7))

      (wedding-attended)
    )
  )

  (:metric minimize (total-cost))
)
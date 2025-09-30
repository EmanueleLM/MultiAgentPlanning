(define (domain trip)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person city day)

  (:predicates
    (current-day ?d - day)
    (at ?p - person ?c - city ?d - day)
  )

  ;; Actions: for each day d in 1..14 and for each allowed transition (stay or direct flight),
  ;; move from day d to d+1, asserting presence at the destination city on day d+1.
  ;; Allowed connections (direct flights) per specification:
  ;;   Vienna <-> Valencia
  ;;   Vilnius <-> Vienna
  ;; Staying in the same city is always allowed (stay action).

  ;; Day 1 -> Day 2 transitions
  (:action move-vienna-to-vienna-day1
    :precondition (and (current-day day1) (at you vienna day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you vienna day2))
  )
  (:action move-vienna-to-valencia-day1
    :precondition (and (current-day day1) (at you vienna day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you valencia day2))
  )
  (:action move-vienna-to-vilnius-day1
    :precondition (and (current-day day1) (at you vienna day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you vilnius day2))
  )

  (:action move-vilnius-to-vilnius-day1
    :precondition (and (current-day day1) (at you vilnius day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you vilnius day2))
  )
  (:action move-vilnius-to-vienna-day1
    :precondition (and (current-day day1) (at you vilnius day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you vienna day2))
  )

  (:action move-valencia-to-valencia-day1
    :precondition (and (current-day day1) (at you valencia day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you valencia day2))
  )
  (:action move-valencia-to-vienna-day1
    :precondition (and (current-day day1) (at you valencia day1))
    :effect (and (not (current-day day1)) (current-day day2) (at you vienna day2))
  )

  ;; Day 2 -> Day 3 transitions
  (:action move-vienna-to-vienna-day2
    :precondition (and (current-day day2) (at you vienna day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you vienna day3))
  )
  (:action move-vienna-to-valencia-day2
    :precondition (and (current-day day2) (at you vienna day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you valencia day3))
  )
  (:action move-vienna-to-vilnius-day2
    :precondition (and (current-day day2) (at you vienna day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you vilnius day3))
  )

  (:action move-vilnius-to-vilnius-day2
    :precondition (and (current-day day2) (at you vilnius day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you vilnius day3))
  )
  (:action move-vilnius-to-vienna-day2
    :precondition (and (current-day day2) (at you vilnius day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you vienna day3))
  )

  (:action move-valencia-to-valencia-day2
    :precondition (and (current-day day2) (at you valencia day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you valencia day3))
  )
  (:action move-valencia-to-vienna-day2
    :precondition (and (current-day day2) (at you valencia day2))
    :effect (and (not (current-day day2)) (current-day day3) (at you vienna day3))
  )

  ;; Day 3 -> Day 4 transitions
  (:action move-vienna-to-vienna-day3
    :precondition (and (current-day day3) (at you vienna day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you vienna day4))
  )
  (:action move-vienna-to-valencia-day3
    :precondition (and (current-day day3) (at you vienna day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you valencia day4))
  )
  (:action move-vienna-to-vilnius-day3
    :precondition (and (current-day day3) (at you vienna day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you vilnius day4))
  )

  (:action move-vilnius-to-vilnius-day3
    :precondition (and (current-day day3) (at you vilnius day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you vilnius day4))
  )
  (:action move-vilnius-to-vienna-day3
    :precondition (and (current-day day3) (at you vilnius day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you vienna day4))
  )

  (:action move-valencia-to-valencia-day3
    :precondition (and (current-day day3) (at you valencia day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you valencia day4))
  )
  (:action move-valencia-to-vienna-day3
    :precondition (and (current-day day3) (at you valencia day3))
    :effect (and (not (current-day day3)) (current-day day4) (at you vienna day4))
  )

  ;; Day 4 -> Day 5 transitions
  (:action move-vienna-to-vienna-day4
    :precondition (and (current-day day4) (at you vienna day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you vienna day5))
  )
  (:action move-vienna-to-valencia-day4
    :precondition (and (current-day day4) (at you vienna day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you valencia day5))
  )
  (:action move-vienna-to-vilnius-day4
    :precondition (and (current-day day4) (at you vienna day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you vilnius day5))
  )

  (:action move-vilnius-to-vilnius-day4
    :precondition (and (current-day day4) (at you vilnius day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you vilnius day5))
  )
  (:action move-vilnius-to-vienna-day4
    :precondition (and (current-day day4) (at you vilnius day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you vienna day5))
  )

  (:action move-valencia-to-valencia-day4
    :precondition (and (current-day day4) (at you valencia day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you valencia day5))
  )
  (:action move-valencia-to-vienna-day4
    :precondition (and (current-day day4) (at you valencia day4))
    :effect (and (not (current-day day4)) (current-day day5) (at you vienna day5))
  )

  ;; Day 5 -> Day 6 transitions
  (:action move-vienna-to-vienna-day5
    :precondition (and (current-day day5) (at you vienna day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you vienna day6))
  )
  (:action move-vienna-to-valencia-day5
    :precondition (and (current-day day5) (at you vienna day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you valencia day6))
  )
  (:action move-vienna-to-vilnius-day5
    :precondition (and (current-day day5) (at you vienna day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you vilnius day6))
  )

  (:action move-vilnius-to-vilnius-day5
    :precondition (and (current-day day5) (at you vilnius day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you vilnius day6))
  )
  (:action move-vilnius-to-vienna-day5
    :precondition (and (current-day day5) (at you vilnius day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you vienna day6))
  )

  (:action move-valencia-to-valencia-day5
    :precondition (and (current-day day5) (at you valencia day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you valencia day6))
  )
  (:action move-valencia-to-vienna-day5
    :precondition (and (current-day day5) (at you valencia day5))
    :effect (and (not (current-day day5)) (current-day day6) (at you vienna day6))
  )

  ;; Day 6 -> Day 7 transitions
  (:action move-vienna-to-vienna-day6
    :precondition (and (current-day day6) (at you vienna day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you vienna day7))
  )
  (:action move-vienna-to-valencia-day6
    :precondition (and (current-day day6) (at you vienna day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you valencia day7))
  )
  (:action move-vienna-to-vilnius-day6
    :precondition (and (current-day day6) (at you vienna day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you vilnius day7))
  )

  (:action move-vilnius-to-vilnius-day6
    :precondition (and (current-day day6) (at you vilnius day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you vilnius day7))
  )
  (:action move-vilnius-to-vienna-day6
    :precondition (and (current-day day6) (at you vilnius day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you vienna day7))
  )

  (:action move-valencia-to-valencia-day6
    :precondition (and (current-day day6) (at you valencia day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you valencia day7))
  )
  (:action move-valencia-to-vienna-day6
    :precondition (and (current-day day6) (at you valencia day6))
    :effect (and (not (current-day day6)) (current-day day7) (at you vienna day7))
  )

  ;; Day 7 -> Day 8 transitions
  (:action move-vienna-to-vienna-day7
    :precondition (and (current-day day7) (at you vienna day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you vienna day8))
  )
  (:action move-vienna-to-valencia-day7
    :precondition (and (current-day day7) (at you vienna day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you valencia day8))
  )
  (:action move-vienna-to-vilnius-day7
    :precondition (and (current-day day7) (at you vienna day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you vilnius day8))
  )

  (:action move-vilnius-to-vilnius-day7
    :precondition (and (current-day day7) (at you vilnius day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you vilnius day8))
  )
  (:action move-vilnius-to-vienna-day7
    :precondition (and (current-day day7) (at you vilnius day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you vienna day8))
  )

  (:action move-valencia-to-valencia-day7
    :precondition (and (current-day day7) (at you valencia day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you valencia day8))
  )
  (:action move-valencia-to-vienna-day7
    :precondition (and (current-day day7) (at you valencia day7))
    :effect (and (not (current-day day7)) (current-day day8) (at you vienna day8))
  )

  ;; Day 8 -> Day 9 transitions
  (:action move-vienna-to-vienna-day8
    :precondition (and (current-day day8) (at you vienna day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you vienna day9))
  )
  (:action move-vienna-to-valencia-day8
    :precondition (and (current-day day8) (at you vienna day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you valencia day9))
  )
  (:action move-vienna-to-vilnius-day8
    :precondition (and (current-day day8) (at you vienna day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you vilnius day9))
  )

  (:action move-vilnius-to-vilnius-day8
    :precondition (and (current-day day8) (at you vilnius day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you vilnius day9))
  )
  (:action move-vilnius-to-vienna-day8
    :precondition (and (current-day day8) (at you vilnius day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you vienna day9))
  )

  (:action move-valencia-to-valencia-day8
    :precondition (and (current-day day8) (at you valencia day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you valencia day9))
  )
  (:action move-valencia-to-vienna-day8
    :precondition (and (current-day day8) (at you valencia day8))
    :effect (and (not (current-day day8)) (current-day day9) (at you vienna day9))
  )

  ;; Day 9 -> Day 10 transitions
  (:action move-vienna-to-vienna-day9
    :precondition (and (current-day day9) (at you vienna day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you vienna day10))
  )
  (:action move-vienna-to-valencia-day9
    :precondition (and (current-day day9) (at you vienna day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you valencia day10))
  )
  (:action move-vienna-to-vilnius-day9
    :precondition (and (current-day day9) (at you vienna day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you vilnius day10))
  )

  (:action move-vilnius-to-vilnius-day9
    :precondition (and (current-day day9) (at you vilnius day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you vilnius day10))
  )
  (:action move-vilnius-to-vienna-day9
    :precondition (and (current-day day9) (at you vilnius day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you vienna day10))
  )

  (:action move-valencia-to-valencia-day9
    :precondition (and (current-day day9) (at you valencia day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you valencia day10))
  )
  (:action move-valencia-to-vienna-day9
    :precondition (and (current-day day9) (at you valencia day9))
    :effect (and (not (current-day day9)) (current-day day10) (at you vienna day10))
  )

  ;; Day 10 -> Day 11 transitions
  (:action move-vienna-to-vienna-day10
    :precondition (and (current-day day10) (at you vienna day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you vienna day11))
  )
  (:action move-vienna-to-valencia-day10
    :precondition (and (current-day day10) (at you vienna day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you valencia day11))
  )
  (:action move-vienna-to-vilnius-day10
    :precondition (and (current-day day10) (at you vienna day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you vilnius day11))
  )

  (:action move-vilnius-to-vilnius-day10
    :precondition (and (current-day day10) (at you vilnius day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you vilnius day11))
  )
  (:action move-vilnius-to-vienna-day10
    :precondition (and (current-day day10) (at you vilnius day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you vienna day11))
  )

  (:action move-valencia-to-valencia-day10
    :precondition (and (current-day day10) (at you valencia day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you valencia day11))
  )
  (:action move-valencia-to-vienna-day10
    :precondition (and (current-day day10) (at you valencia day10))
    :effect (and (not (current-day day10)) (current-day day11) (at you vienna day11))
  )

  ;; Day 11 -> Day 12 transitions
  (:action move-vienna-to-vienna-day11
    :precondition (and (current-day day11) (at you vienna day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you vienna day12))
  )
  (:action move-vienna-to-valencia-day11
    :precondition (and (current-day day11) (at you vienna day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you valencia day12))
  )
  (:action move-vienna-to-vilnius-day11
    :precondition (and (current-day day11) (at you vienna day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you vilnius day12))
  )

  (:action move-vilnius-to-vilnius-day11
    :precondition (and (current-day day11) (at you vilnius day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you vilnius day12))
  )
  (:action move-vilnius-to-vienna-day11
    :precondition (and (current-day day11) (at you vilnius day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you vienna day12))
  )

  (:action move-valencia-to-valencia-day11
    :precondition (and (current-day day11) (at you valencia day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you valencia day12))
  )
  (:action move-valencia-to-vienna-day11
    :precondition (and (current-day day11) (at you valencia day11))
    :effect (and (not (current-day day11)) (current-day day12) (at you vienna day12))
  )

  ;; Day 12 -> Day 13 transitions
  (:action move-vienna-to-vienna-day12
    :precondition (and (current-day day12) (at you vienna day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you vienna day13))
  )
  (:action move-vienna-to-valencia-day12
    :precondition (and (current-day day12) (at you vienna day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you valencia day13))
  )
  (:action move-vienna-to-vilnius-day12
    :precondition (and (current-day day12) (at you vienna day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you vilnius day13))
  )

  (:action move-vilnius-to-vilnius-day12
    :precondition (and (current-day day12) (at you vilnius day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you vilnius day13))
  )
  (:action move-vilnius-to-vienna-day12
    :precondition (and (current-day day12) (at you vilnius day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you vienna day13))
  )

  (:action move-valencia-to-valencia-day12
    :precondition (and (current-day day12) (at you valencia day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you valencia day13))
  )
  (:action move-valencia-to-vienna-day12
    :precondition (and (current-day day12) (at you valencia day12))
    :effect (and (not (current-day day12)) (current-day day13) (at you vienna day13))
  )

  ;; Day 13 -> Day 14 transitions
  (:action move-vienna-to-vienna-day13
    :precondition (and (current-day day13) (at you vienna day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you vienna day14))
  )
  (:action move-vienna-to-valencia-day13
    :precondition (and (current-day day13) (at you vienna day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you valencia day14))
  )
  (:action move-vienna-to-vilnius-day13
    :precondition (and (current-day day13) (at you vienna day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you vilnius day14))
  )

  (:action move-vilnius-to-vilnius-day13
    :precondition (and (current-day day13) (at you vilnius day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you vilnius day14))
  )
  (:action move-vilnius-to-vienna-day13
    :precondition (and (current-day day13) (at you vilnius day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you vienna day14))
  )

  (:action move-valencia-to-valencia-day13
    :precondition (and (current-day day13) (at you valencia day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you valencia day14))
  )
  (:action move-valencia-to-vienna-day13
    :precondition (and (current-day day13) (at you valencia day13))
    :effect (and (not (current-day day13)) (current-day day14) (at you vienna day14))
  )

  ;; Day 14 -> Day 15 transitions
  (:action move-vienna-to-vienna-day14
    :precondition (and (current-day day14) (at you vienna day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you vienna day15))
  )
  (:action move-vienna-to-valencia-day14
    :precondition (and (current-day day14) (at you vienna day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you valencia day15))
  )
  (:action move-vienna-to-vilnius-day14
    :precondition (and (current-day day14) (at you vienna day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you vilnius day15))
  )

  (:action move-vilnius-to-vilnius-day14
    :precondition (and (current-day day14) (at you vilnius day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you vilnius day15))
  )
  (:action move-vilnius-to-vienna-day14
    :precondition (and (current-day day14) (at you vilnius day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you vienna day15))
  )

  (:action move-valencia-to-valencia-day14
    :precondition (and (current-day day14) (at you valencia day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you valencia day15))
  )
  (:action move-valencia-to-vienna-day14
    :precondition (and (current-day day14) (at you valencia day14))
    :effect (and (not (current-day day14)) (current-day day15) (at you vienna day15))
  )
)
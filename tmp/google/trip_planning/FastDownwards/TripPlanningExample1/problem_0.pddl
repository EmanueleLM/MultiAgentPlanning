(define (problem integrated-trip)
  (:domain integrated-travel)

  (:objects
    planner - person
    riga manchester split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ;; Unified starting location (Agent 2 and Agent 3 used Riga as a start; we make planner start in Riga)
    (at-person planner riga)

    ;; Known direct flights (public information). All fly actions require these direct predicates.
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

    ;; Agent 2 day objects are initially all unassigned
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

    ;; Numeric initializations
    (= (total-days) 0)
    (= (days-left) 15)
    (= (days riga) 0)
    (= (days manchester) 0)
    (= (days split) 0)
  )

  ;; Integrated goal:
  ;; - Total of 15 days allocated (global)
  ;; - Keep Agent 1's requirement: spend exactly 6 days in Split
  ;; - Keep Agent 2's requirement: spend exactly 4 days in Manchester
  ;; - Make the remaining days in Riga so the totals sum to 15 (5 days)
  ;;   (this resolves the numeric conflict between agents into a consistent global plan)
  (:goal (and
    (= (total-days) 15)
    (= (days-left) 0)

    ;; exact per-city allocations required by the integrated plan
    (= (days split) 6)
    (= (days manchester) 4)
    (= (days riga) 5)
  ))
)
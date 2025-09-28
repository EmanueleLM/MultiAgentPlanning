(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    florence munich warsaw - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )
  (:init
    (free day1) (free day2) (free day3) (free day4) (free day5) (free day6) (free day7)
    (free day8) (free day9) (free day10) (free day11) (free day12) (free day13)
    (first day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)
    (next day11 day12) (next day12 day13)

    ;; direct flight connectivity (bidirectional as provided) and reflexive flights to allow staying
    (flight florence munich) (flight munich florence)
    (flight munich warsaw) (flight warsaw munich)
    (flight florence florence) (flight munich munich) (flight warsaw warsaw)
  )
  (:goal (and
    ;; Orchestrator-resolved itinerary that minimally adjusts traveler preferences to meet total_days=13:
    ;; Florence: 2 days (day1-2), Munich: 5 days (day3-7), Warsaw: 6 days (day8-13)
    (at florence day1) (at florence day2)
    (at munich day3) (at munich day4) (at munich day5) (at munich day6) (at munich day7)
    (at warsaw day8) (at warsaw day9) (at warsaw day10) (at warsaw day11) (at warsaw day12) (at warsaw day13)
  )) 
)
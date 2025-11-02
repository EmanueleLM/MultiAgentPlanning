; PDDL problem instance for Fast Downward using domain trip-direct-flights
(define (problem trip-visit-f-b-s)
  (:domain trip-direct-flights)

  (:objects
    frankfurt bucharest stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ; Initial location: start in Bucharest on day1 (this supports the chosen feasible schedule)
    (at bucharest day1)
    (visited-bucharest)

    ; Successor relations (day progression) 1->2, 2->3, ..., 9->10
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10)

    ; Workshop allowed days: day5 through day10 (inclusive)
    (workshop-day day5) (workshop-day day6) (workshop-day day7)
    (workshop-day day8) (workshop-day day9) (workshop-day day10)

    ; No left-* flags set initially (closed-world: they are false unless set by actions)
    ; visited-frankfurt / visited-stuttgart are false initially (will be set on arrival)
    ; attended-workshop false initially (must be achieved on a valid workshop-day)
  )

  ; Global goals:
  ; - attend the Stuttgart workshop on some day in [5..10] (enforced by executing attend-workshop while at Stuttgart on a workshop-day)
  ; - visit Bucharest, Frankfurt, and Stuttgart at least once
  (:goal (and
    (attended-workshop)
    (visited-bucharest)
    (visited-frankfurt)
    (visited-stuttgart)
  ))
)
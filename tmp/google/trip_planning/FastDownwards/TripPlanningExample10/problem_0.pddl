(define (problem combined-trip-9days)
  (:domain combined-europe-trip)

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; Numeric counters initialization
    (= (day) 1)
    (= (oslo-days) 0)
    (= (valencia-days) 0)
    (= (dublin-days) 0)

    ;; Connectivity (provide both predicate flavors that fragments used)
    (connected oslo dublin)
    (connected dublin oslo)
    (connected dublin valencia)
    (connected valencia dublin)

    (flight oslo dublin)
    (flight dublin oslo)
    (flight dublin valencia)
    (flight valencia dublin)

    ;; Day ordering for agent3
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; mark special cities for agent3
    (is-dublin dublin)
    (is-valencia valencia)

    ;; relatives visit window for agent3 (day objects)
    (in-rel-window day5)
    (in-rel-window day6)
    (in-rel-window day7)
    (in-rel-window day8)
    (in-rel-window day9)

    ;; NOTE: no initial (at ...) facts are given -- the planner must choose a start via start-at
  )

  ;; Goals:
  ;; - Visit Oslo, Dublin and Valencia at least once
  ;; - Visit relatives in Valencia during allowed window
  ;; - Spend at least 3 numeric days in Oslo and at least 5 numeric days in Valencia
  ;; - Finish within 9 numeric days
  (:goal (and
    (visited oslo)
    (visited dublin)
    (visited valencia)

    ;; ensure relatives markers (both symbol names used across fragments)
    (relatives-visited)
    (visited-relatives)

    ;; stay requirements we reconcile to be jointly feasible within 9 days:
    (>= (oslo-days) 3)
    (>= (valencia-days) 5)

    ;; total-trip upper bound
    (<= (day) 9)
  ))
)
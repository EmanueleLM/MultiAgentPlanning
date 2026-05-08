(define (problem trip_planning_example48)
  (:domain trip_planning_instance)
  (:objects
    split manchester geneva - city
    day1 day2 day3 day4 - day
  )

  (:init
    ;; day ordering
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)

    ;; direct flights (as provided)
    (direct_flight split geneva)
    (direct_flight geneva split)
    (direct_flight manchester split)
    (direct_flight manchester geneva)
  )

  ;; NOTE: The goal preserves the user's hard constraints verbatim.
  ;; These constraints require being in multiple different cities on the same day
  ;; (e.g. manchester and geneva on day1) and require visiting three cities
  ;; for two days each while the trip has only 4 days total. The instance
  ;; is therefore contradictory / impossible. The problem encodes the exact
  ;; original requirements rather than silently relaxing them.
  (:goal
    (and
      ;; all four days must be assigned a city
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)

      ;; meeting requirement: be in Split between day2 and day3
      (at split day2)
      (at split day3)

      ;; user-specified stay requirements (preserved exactly)
      (at manchester day1)
      (at manchester day4)

      (at geneva day1)
      (at geneva day4)
    )
  )
)
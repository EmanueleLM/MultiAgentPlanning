(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; Direct flights (only direct flights are allowed)
    (flight mykonos vienna)
    (flight vienna mykonos)
    (flight vienna venice)
    (flight venice vienna)

    ;; Mark Venice
    (is-venice venice)

    ;; Prev day relations
    (prev d1 d2) (prev d2 d3) (prev d3 d4) (prev d4 d5)
    (prev d5 d6) (prev d6 d7) (prev d7 d8) (prev d8 d9)
    (prev d9 d10)

    ;; Workshop must be attended between day5 and day10 (these are workshop-eligible days)
    (is-workshop-day d5) (is-workshop-day d6) (is-workshop-day d7)
    (is-workshop-day d8) (is-workshop-day d9) (is-workshop-day d10)

    ;; Numeric initializations: allocated days start at 0
    (= (allocated-days mykonos) 0)
    (= (allocated-days vienna) 0)
    (= (allocated-days venice) 0)
    (= (total-allocated) 0)

    ;; Required/preferred stays (these are initial preferences; they can be reduced via reduce-required actions
    ;; to allow feasibility within the 10-day trip)
    (= (required-days mykonos) 2)
    (= (required-days vienna) 4)
    (= (required-days venice) 6)
  )

  (:goal (and
    ;; Total allocated days must equal the trip length (10 days)
    (= (total-allocated) 10)

    ;; Workshop attendance in Venice between day5 and day10
    (workshop-attended)

    ;; For each city, the allocated days must be at least the currently required/preferred days.
    ;; reduce-required actions can lower required-days so this becomes satisfiable if initial sum exceeds 10.
    (>= (allocated-days mykonos) (required-days mykonos))
    (>= (allocated-days vienna) (required-days vienna))
    (>= (allocated-days venice) (required-days venice))
  ))

  ;; No metric specified; planner will find any feasible plan meeting constraints.
)
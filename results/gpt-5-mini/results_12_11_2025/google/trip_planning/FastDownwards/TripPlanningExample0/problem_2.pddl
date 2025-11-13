(define (problem TripPlanningExample0-problem)
  (:domain trip-domain)
  (:objects
    helsinki barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )
  (:init
    ;; next-day chain
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)

    ;; available direct flights (only these edges are allowed)
    (direct barcelona florence)
    (direct florence barcelona)
    (direct helsinki barcelona)
    (direct barcelona helsinki)

    ;; Enforce exact flight departure days to realize the audited contiguous stays:
    ;; depart Helsinki -> Barcelona on day 3 (arrive day4)
    (allowed-flight helsinki barcelona d3)
    ;; depart Barcelona -> Florence on day 8 (arrive day9)
    (allowed-flight barcelona florence d8)

    ;; Meeting window (Florence) inclusive days 9..14
    (meeting-window d9)
    (meeting-window d10)
    (meeting-window d11)
    (meeting-window d12)
    (meeting-window d13)
    (meeting-window d14)

    ;; Mark which city is Florence for parameterized meeting action
    (is-florence florence)

    ;; Trip starts in Helsinki on day 1
    (at helsinki d1)

    ;; Mark the final day explicitly
    (last d14)
  )

  ;; Goals: must finish the trip after day 14 and meet the friend in Florence during the window
  (:goal (and (finished) (met)))
)
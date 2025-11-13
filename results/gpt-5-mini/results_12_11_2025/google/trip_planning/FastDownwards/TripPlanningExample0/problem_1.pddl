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

    ;; Allowed flight days (these enforce the exact stay lengths in the audited plan)
    ;; Fly Helsinki -> Barcelona on day 3 (i.e., depart on day3 and arrive day4)
    (allowed-flight helsinki barcelona d3)
    ;; Fly Barcelona -> Florence on day 8 (i.e., depart on day8 and arrive day9)
    (allowed-flight barcelona florence d8)

    ;; Meeting window days in Florence (inclusive days 9..14)
    (meeting-window d9)
    (meeting-window d10)
    (meeting-window d11)
    (meeting-window d12)
    (meeting-window d13)
    (meeting-window d14)

    ;; Trip starts in Helsinki on day 1
    (at helsinki d1)

    ;; Mark the final day explicitly (used by the finish action)
    (last d14)
  )

  ;; Goals: the trip must be finished after completing day 14 and the friend must be met in Florence
  (:goal (and (finished) (met)))
)
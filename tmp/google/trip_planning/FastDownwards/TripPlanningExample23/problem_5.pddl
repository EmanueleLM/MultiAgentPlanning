(define (problem multi-trip-problem)
  (:domain multi-agent-trip)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )
  (:init
    ;; day progression links
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; start on day 1
    (current-day d1)

    ;; starting location
    (at london)
    (visited london)

    ;; available direct flights (only these may be used)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    ;; workshop info (private information from stay_agent)
    (workshop riga)
    (allowed-workshop-day d5)
    (allowed-workshop-day d6)
    (allowed-workshop-day d7)
    (allowed-workshop-day d8)
  )
  (:goal
    (and
      ;; total trip length must be 8 days -> current-day d9 (after consuming d1..d8)
      (current-day d9)
      ;; attend the workshop in Riga between day5 and day8
      (attended-workshop)
      ;; visit all three cities at least once
      (visited london)
      (visited bucharest)
      (visited riga)
    )
  )
)
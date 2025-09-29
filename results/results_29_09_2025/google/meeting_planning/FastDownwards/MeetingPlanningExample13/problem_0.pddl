(define (problem meet-betty-problem)
  (:domain meet-betty-domain)
  (:objects
    you betty - agent
    presidio northbeach - location
  )

  (:init
    ; Start clock at 09:00 (540 minutes) because "you arrive at Presidio at 09:00"
    (= (clock) 540)
    (= (meeting-start) 100000)           ; large sentinel (will be overwritten at meeting start)
    (= (total-meeting-time) 0)
    (= (total-cost) 100000.0)

    ; Initial locations: you are at Presidio at 09:00. Betty is not yet at North Beach
    (at you presidio)
    ; betty will be at North Beach only between 1125 and 1320 — modeled via arrive-betty and meeting constraints
  )

  ; Hard numeric goal: meeting time with Betty must be at least 75 minutes.
  (:goal (and
    (met you betty)
    (>= (total-meeting-time) 75)
  ))

  ; Optimization: prefer the earliest feasible meeting start, and as a hard preference maximize meeting time.
  ; Encoded as minimizing total-cost = meeting-start - 0.001 * total-meeting-time
  (:metric minimize (total-cost))
)
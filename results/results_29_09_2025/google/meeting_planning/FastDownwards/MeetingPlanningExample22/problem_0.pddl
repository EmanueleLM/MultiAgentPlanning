(define (problem sf-meet-problem)
  (:domain sf-meet)

  (:objects
    traveler andrew - agent
    Presidio UnionSquare - location
  )

  ; Initial state:
  ; - traveler is at Presidio and arrives at 09:00 (540 minutes)
  ; - Andrew is at Union Square (publicly stated), available between 11:15 (675) and 17:15 (1035)
  ;   (availability window is encoded via the temporal pre/postconditions of the meeting action;
  ;    no other availability is invented)
  ; - numeric fluents initialized
  (:init
    (at traveler Presidio)
    (at andrew UnionSquare)

    (= (current-time) 540)   ; 09:00 arrival at Presidio (private constraint enforced)
    (= (andrew-time) 0)
    (= (num-friends-met) 0)
    ; met-andrew is false by omission (no (met-andrew) fact)
  )

  ; Goal: satisfy the primary (hard) requirement: at least 105 minutes with Andrew.
  ; Secondary objective is expressed via :metric to maximize distinct friends met.
  (:goal (and
    (>= (andrew-time) 105)
  ))

  ; Optimization objective: maximize the number of distinct friends met (numeric fluent).
  (:metric maximize (num-friends-met))
)
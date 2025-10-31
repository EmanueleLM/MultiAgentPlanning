(define (problem meet-margaret-problem)
  (:domain meeting-scheduling)
  (:objects
    you margaret - agent
    marina-district pacific-heights - location
  )

  (:init
    ; Starting locations
    (at you marina-district)
    (at margaret pacific-heights)

    ; Initial times (minutes since midnight):
    ; "you" arrives at Marina District at 9:00 AM = 9*60 = 540
    (assign (time-you) 540)
    ; Margaret is at Pacific Heights from 7:00 PM to 7:45 PM:
    ; 7:00 PM = 19*60 = 1140, 7:45 PM = 1145? (actually 19*60+45 = 1140+45 = 1185)
    (assign (time-margaret) 1140)

    ; Set Margaret's availability window:
    (assign (marg-window-start) 1140)
    (assign (marg-window-end) 1185)

    ; Start with zero meetings recorded
    (assign (total-meetings) 0)
  )

  ; Goal: ensure at least one meeting with Margaret of at least 15 minutes.
  ; Also the planner will try to maximize total-meetings (metric below).
  (:goal (and
            (met-you-margaret)
         )
  )

  ; Metric: maximize the number of meetings (planner will attempt to maximize this
  ; while satisfying the goal).
  (:metric maximize (total-meetings))
)
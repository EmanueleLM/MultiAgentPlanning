(define (problem meet-betty-problem)
  (:domain meet-orchestrator)

  (:objects
    you betty - agent
    presidio north_beach - location
  )

  ;; time 0 corresponds to 09:00 (your arrival at Presidio)
  (:init
    ;; initial locations
    (at you presidio)
    ;; Betty will be at north_beach only during the availability window; modeled with timed initial literals below

    ;; numeric fluent
    (= (met-time) 0)
  )

  ;; Betty's availability window: from 18:45 to 22:00.
  ;; Relative to the initial time (09:00):
  ;;   18:45 is 9 hours 45 minutes after 09:00 -> 585 minutes
  ;;   22:00 is 13 hours after 09:00 -> 780 minutes
  (:timed-initial-literals
    ;; Betty becomes present at north_beach at t = 585
    (at 585 (at betty north_beach))
    ;; Betty leaves north_beach at t = 780
    (at 780 (not (at betty north_beach)))

    ;; Betty is available during the same window
    (at 585 (available-betty))
    (at 780 (not (available-betty)))
  )

  ;; Global goal: ensure at least 75 minutes of meeting time with Betty.
  ;; We also request optimization to maximize total meeting time (met-time).
  (:goal (and
           (>= (met-time) 75)
         )
  )

  ;; Optimize: maximize the total minutes spent meeting Betty.
  (:metric maximize (met-time))
)
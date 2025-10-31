(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler john orchestrator - agent
    rh ggp - location
  )
  (:init
    ;; initial physical location and time
    (at traveler rh)
    (at john ggp)
    (= (current-time) 540) ;; 09:00 = 540 minutes since midnight

    ;; Public information encoded structurally:
    ;; Travel durations (minutes): RH->GGP = 21, GGP->RH = 19 are encoded as durative-action durations.
    ;; John's availability window: 13:00 (780) to 18:15 (1095)
    ;; The meeting action enforces start >= 780 and end <= 1095 and requires duration 90 minutes.
  )
  (:goal (met))
)
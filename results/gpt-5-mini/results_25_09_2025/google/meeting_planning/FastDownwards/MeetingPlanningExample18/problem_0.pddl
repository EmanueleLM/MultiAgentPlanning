(define (problem meet-betty)
  (:domain multiagent-meet)
  (:objects
    marina richmond - location
  )

  (:init
    ; Traveler arrives at Marina District at 09:00 -> 9*60 = 540 minutes
    (at-traveler marina)
    (= (time) 540)
    (= (met-minutes) 0)
  )

  ; Global goal: meet Betty for at least 75 minutes within her availability window (20:30-22:00).
  (:goal (and
    (>= (met-minutes) 75)
  ))
  ; Also prefer plans that maximize meeting minutes (and thus maximize friends met, here Betty).
  (:metric maximize (met-minutes))
)
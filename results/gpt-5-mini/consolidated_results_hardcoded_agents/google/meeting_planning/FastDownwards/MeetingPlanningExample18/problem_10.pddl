(define (problem meetingplanningexample18-problem)
  (:domain meetingplanningexample18-domain)

  (:objects
    marina richmond - location
  )

  (:init
    ;; start at Marina at 09:00 = 540 minutes since midnight
    (at marina)
    (= (time) 540)
    (= (total-cost) 0)
  )

  ;; Goal: have a single continuous meeting with Betty of at least 75 minutes
  ;; occurring wholly inside her availability window (20:30–22:00).
  (:goal (met-betty))

  ;; Prefer plans with less travel (total travel minutes minimized).
  (:metric minimize (total-cost))
)
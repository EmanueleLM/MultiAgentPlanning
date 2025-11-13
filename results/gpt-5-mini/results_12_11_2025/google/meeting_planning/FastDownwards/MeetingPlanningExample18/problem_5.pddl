(define (problem meetingplanningexample18-problem)
  (:domain meetingplanningexample18-domain)
  (:objects
    marina richmond - location
  )
  (:init
    ;; start at Marina at 09:00 (540 minutes)
    (at marina)
    (= (current-time) 540)
    ;; Betty available 20:30 (1230) .. 22:00 (1320)
    (= (betty-start) 1230)
    (= (betty-end) 1320)
    (= (total-cost) 0)
  )
  (:goal (met-betty))
  (:metric minimize (total-cost))
)
(define (problem coordinated-meet-ronald)
  (:domain coordinated-meetings)

  (:objects
    visitor ronald - agent
    chinatown russian-hill - location
  )

  (:init
    ;; Both agents start at Chinatown at 09:00 -> time = 0 (minutes since 09:00)
    (at visitor chinatown)
    (at ronald chinatown)
    (= (time) 0)
    (= (met) 0)
  )

  ;; Goal: ensure that the visitor has met Ronald for at least 105 minutes.
  ;; Planner is encouraged to minimize the final time to get the meeting done earlier.
  (:goal (>= (met) 105))

  (:metric minimize (time))
)
(define (problem integrated-meet-mary)
  (:domain integrated-meeting-domain)
  (:objects
    visitor mary - agent
    Nob_Hill Marina_District - location
  )
  (:init
    ;; Both arrive at Nob_Hill at 09:00 -> 9*60 = 540 minutes since midnight
    (at visitor Nob_Hill)
    (at mary Nob_Hill)
    (= (time) 540)

    ;; Public knowledge: Mary will be at Marina_District from 20:00 to 22:00
    (will-be-at-marina-window)
  )
  (:goal (and
    (met-mary)
    (met-visitor)
  ))
  ;; Optional: minimize end time
  ;; (:metric minimize (time))
)
(define (problem combined-meeting)
  (:domain meeting-domain)
  (:objects
    traveler sarah - agent
    richmond presidio - location
  )

  ;; Initial facts:
  ;; - Traveler is at Richmond at time 0 (09:00).
  ;; - Meeting length starts at 0.
  (:init
    (at traveler richmond)
    (= (meeting-length) 0)
  )

  ;; Timed initial literals encode Sarah's availability window and presence at Presidio:
  ;; - At 13:15 (which is 255 minutes after 09:00) Sarah is at Presidio.
  ;; - At 15:15 (375 minutes after 09:00) Sarah is no longer at Presidio.
  ;; These TILs ensure that the planner can only schedule the meeting while Sarah is present.
  (:timed-initial-literals
    (at 255 (at sarah presidio))
    (at 375 (not (at sarah presidio)))
  )

  ;; Goal: have completed a meeting of at least 105 minutes.
  (:goal (and (met) (>= (meeting-length) 105)))

  ;; Objective: maximize meeting-length (prefer longer meetings within Sarah's availability window).
  (:metric maximize (meeting-length))
)
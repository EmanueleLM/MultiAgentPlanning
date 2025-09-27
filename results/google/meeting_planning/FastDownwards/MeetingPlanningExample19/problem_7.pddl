(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects)
  (:init
    ;; Start at Golden Gate Park at 09:00 (9*60 = 540 minutes)
    (at traveler ggp)
    ;; John's location is Pacific Heights; availability enforced by meet_john temporal preconditions
    (at john ph)
    (= (current-time) 540)
  )
  (:goal (met-john))
)
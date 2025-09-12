(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    slot1 slot2 slot3 - time)

  (:init
    (blocked_raymond slot1)
    (blocked_raymond slot2)
    (blocked_raymond slot3)

    (blocked_billy slot1)
    (not (preferred_billy slot3))  ; Here indicating Billy prefers before slot3 after 15:00

    (blocked_donald slot1)
    (blocked_donald slot2)
  )

  (:goal
    (exists (?time - time) (meeting_set ?time)))
  
  (:metric minimize (total-cost))
)
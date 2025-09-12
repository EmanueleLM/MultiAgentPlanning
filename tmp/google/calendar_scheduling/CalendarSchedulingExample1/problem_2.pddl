(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    slot1 slot2 slot3 - time)

  (:init
    (available raymond slot1)
    (available raymond slot2)
    (available billy slot1)
    (available billy slot3)
    (available donald slot2)
    (available donald slot3))

  (:goal
    (exists (?time - time) (meeting_set ?time)))
)
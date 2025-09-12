(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    raymond billy donald - agent
    slot1 slot2 slot3 - time)

  (:init
    )

  (:goal
    (exists (?time - time) (meeting_set ?time)))
)
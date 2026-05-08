(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    time_slot
  )

  (:predicates
    (blocked ?p - participant ?t - time_slot)
    (selected ?t - time_slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (blocked catherine ?t))
      (not (blocked michael ?t))
      (not (blocked alexander ?t))
    )
    :effect (and
      (selected ?t)
      (meeting_scheduled)
    )
  )
)
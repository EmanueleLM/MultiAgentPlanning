(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    day
    time_slot
  )

  (:predicates
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled ?p - participant)
    (within_work_hours ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - participant ?t - time_slot)
    :precondition (and
      (within_work_hours ?t)
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
      (not (meeting_scheduled ?p1))
      (not (meeting_scheduled ?p2))
      (not (meeting_scheduled ?p3))
    )
    :effect (and
      (meeting_scheduled ?p1)
      (meeting_scheduled ?p2)
      (meeting_scheduled ?p3)
    )
  )
)
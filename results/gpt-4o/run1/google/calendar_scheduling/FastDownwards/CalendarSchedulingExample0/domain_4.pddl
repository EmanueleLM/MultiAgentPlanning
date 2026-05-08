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
    :parameters (?t - time_slot)
    :precondition (and
      (within_work_hours ?t)
      (available michelle ?t)
      (available steven ?t)
      (available jerry ?t)
      (not (meeting_scheduled michelle))
      (not (meeting_scheduled steven))
      (not (meeting_scheduled jerry))
    )
    :effect (and
      (meeting_scheduled michelle)
      (meeting_scheduled steven)
      (meeting_scheduled jerry)
    )
  )
)
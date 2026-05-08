(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:constants margaret donna helen - participant)
  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (available margaret ?s)
      (available donna ?s)
      (available helen ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)
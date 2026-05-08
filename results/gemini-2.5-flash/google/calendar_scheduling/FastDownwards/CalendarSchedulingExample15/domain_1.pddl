(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    person
    time_slot
  )

  (:predicates
    (available ?p - person ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )

  (:action schedule_meeting)
    (:parameters (?t - time_slot))
    (:precondition
      (and
        (available joyce ?t)
        (available christine ?t)
        (available alexander ?t)
      )
    )
    (:effect
      (meeting_scheduled ?t)
    )
)
(define (domain calendar-scheduling-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    person
    time_slot
  )
  (:predicates
    (available ?p - person ?s - time_slot)
    (meeting_scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    (:parameters (?s - time_slot))
    (:precondition
      (and
        (available joyce ?s)
        (available christine ?s)
        (available alexander ?s)
        (not (meeting_scheduled ?s)) ; Ensure meeting is not already scheduled for this slot
      )
    )
    (:effect
      (meeting_scheduled ?s)
    )
  )
)
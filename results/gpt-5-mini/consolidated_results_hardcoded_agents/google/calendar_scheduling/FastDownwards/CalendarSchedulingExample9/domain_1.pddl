(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (free ?p - participant ?s - slot)
    (scheduled)
    (chosen ?s - slot)
  )

  (:action schedule_at
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)
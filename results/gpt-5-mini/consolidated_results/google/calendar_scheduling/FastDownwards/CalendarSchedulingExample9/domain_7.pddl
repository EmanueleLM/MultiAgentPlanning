(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled)
    (chosen ?s - slot)
  )

  (:action schedule_at
    :parameters (?s - slot)
    :precondition (and
      (free diane ?s)
      (free kelly ?s)
      (free deborah ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)
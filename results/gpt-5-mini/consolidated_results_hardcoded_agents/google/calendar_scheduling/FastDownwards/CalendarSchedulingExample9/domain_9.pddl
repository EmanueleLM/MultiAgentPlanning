(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (is-participant ?p - participant)
    (is-slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (first-slot ?s - slot)
    (last-slot ?s - slot)
    (free ?p - participant ?s - slot)
    (scheduled)
    (chosen ?s - slot)
  )

  (:action schedule_at
    :parameters (?s - slot)
    :precondition (and
      (is-slot ?s)
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
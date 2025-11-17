(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types attendee slot)
  (:predicates
    (free ?a - attendee ?s - slot)
    (preferred ?s - slot)
    (free-for-all ?s - slot)
    (chosen ?s - slot)
    (scheduled)
    (some-preferred-available)
  )
  (:action select-preferred
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free-for-all ?s)
      (preferred ?s)
      (some-preferred-available)
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
  (:action select-any
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free-for-all ?s)
      (not (some-preferred-available))
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)
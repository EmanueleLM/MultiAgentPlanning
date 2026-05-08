(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (available ?s - slot)
    (chosen ?s - slot)
    (unscheduled)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available ?s)
      (free bobby ?s)
      (free scott ?s)
      (free kimberly ?s)
    )
    :effect (and
      (chosen ?s)
      (not (available ?s))
      (not (unscheduled))
    )
  )
)
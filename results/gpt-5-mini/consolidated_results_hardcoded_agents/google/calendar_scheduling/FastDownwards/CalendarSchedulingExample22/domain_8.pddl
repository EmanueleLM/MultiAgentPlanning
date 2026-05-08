(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types meeting slot)

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot ?s2 - slot)
    (next ?s - slot ?s2 - slot)
    (available ?s - slot)
  )

  (:action choose-start-slot
    :parameters (?m - meeting ?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled ?m)
      (next ?s ?s2)
      (available ?s)
      (available ?s2)
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s ?s2)
    )
  )
)
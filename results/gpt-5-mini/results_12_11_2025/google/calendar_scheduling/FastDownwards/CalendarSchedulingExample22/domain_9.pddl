(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types meeting slot person)

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot ?s2 - slot)
    (next ?s - slot ?s2 - slot)
    (free ?p - person ?s - slot)
  )

  (:action choose-start-slot
    :parameters (?m - meeting ?s - slot ?s2 - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (unscheduled ?m)
      (next ?s ?s2)
      (free ?p1 ?s) (free ?p1 ?s2)
      (free ?p2 ?s) (free ?p2 ?s2)
      (free ?p3 ?s) (free ?p3 ?s2)
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s ?s2)
    )
  )
)
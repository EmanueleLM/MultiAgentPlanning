(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:predicates
    (slot ?s - slot)
    (free ?a - agent ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free jack ?s)
      (free eugene ?s)
      (free patricia ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)
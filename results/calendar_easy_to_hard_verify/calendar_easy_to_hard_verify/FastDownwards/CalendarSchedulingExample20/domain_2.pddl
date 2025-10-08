(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:constants stephen elijah william jeremy timothy - agent)
  (:predicates
    (available ?a - agent ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available stephen ?s)
      (available elijah ?s)
      (available william ?s)
      (available jeremy ?s)
      (available timothy ?s)
    )
    :effect (and
      (scheduled)
      (scheduled-at ?s)
    )
  )
)
(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Single scheduling action parameterized by a half-hour slot.
  ;; It can be applied only if every listed participant is available in that slot.
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
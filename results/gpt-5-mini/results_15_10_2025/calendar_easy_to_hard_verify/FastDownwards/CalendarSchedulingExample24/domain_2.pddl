(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)

  (:predicates
    (free ?p - participant ?s - slot)
    (attended ?p - participant ?s - slot)
    (scheduled ?s - slot)
  )

  (:functions (total-cost))

  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (free ?p ?s)
    :effect (and
      (attended ?p ?s)
      (not (free ?p ?s))
      (increase (total-cost) 0)
    )
  )

  (:action finalize
    :parameters (?s - slot ?ben - participant ?juan - participant ?hea - participant ?nat - participant ?jac - participant)
    :precondition (and
      (attended ?ben ?s)
      (attended ?juan ?s)
      (attended ?hea ?s)
      (attended ?nat ?s)
      (attended ?jac ?s)
    )
    :effect (and
      (scheduled ?s)
      (increase (total-cost) 0)
    )
  )
)
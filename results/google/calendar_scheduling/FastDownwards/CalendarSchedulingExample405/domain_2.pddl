(define (domain schedule-meeting)
  (:requirements :typing :adl :fluents :action-costs)
  (:types participant slot meeting)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (attends ?p - participant ?m - meeting)
  )

  (:functions (total-cost))

  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
      (forall (?p - participant)
        (and (attends ?p ?m)
             (not (free ?p ?s))))
      (increase (total-cost) 1)
    )
  )
)
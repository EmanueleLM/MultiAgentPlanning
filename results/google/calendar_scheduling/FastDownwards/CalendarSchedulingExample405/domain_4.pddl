(define (domain schedule-meeting)
  (:requirements :typing :adl)
  (:types participant slot meeting)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (attends ?p - participant ?m - meeting)
    (next ?s1 - slot ?s2 - slot)
    (work-slot ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (work-slot ?s)
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
      (forall (?p - participant)
        (and (attends ?p ?m)
             (not (free ?p ?s))))
    )
  )
)
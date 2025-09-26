(define (domain meeting-scheduling)
  (:requirements :adl :typing :action-costs)
  (:types slot participant)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
     :parameters (?s - slot)
     :precondition (and
       (slot ?s)
       (not (scheduled))
       (forall (?p - participant) (free ?p ?s))
     )
     :effect (and
       (scheduled)
       (meeting-at ?s)
     )
  )
)
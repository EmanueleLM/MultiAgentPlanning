(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:constants eric jeremy joe brian brittany julia - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot))
  (:action schedule
    :parameters (?s - slot)
    :precondition (and (not (scheduled ?s)) (free eric ?s) (free jeremy ?s) (free joe ?s) (free brian ?s) (free brittany ?s) (free julia ?s))
    :effect (and (scheduled ?s)))
)
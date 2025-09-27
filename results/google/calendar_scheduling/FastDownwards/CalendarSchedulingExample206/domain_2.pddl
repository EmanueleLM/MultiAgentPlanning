(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)
    (preferred_margaret ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule-meeting-preferred
    :parameters (?s - slot)
    :precondition (and (not (scheduled)) (forall (?a - agent) (available ?a ?s)) (preferred_margaret ?s))
    :effect (and (scheduled) (meeting-at ?s))
    :cost 0
  )
  (:action schedule-meeting-nonpreferred
    :parameters (?s - slot)
    :precondition (and (not (scheduled)) (forall (?a - agent) (available ?a ?s)) (not (preferred_margaret ?s)))
    :effect (and (scheduled) (meeting-at ?s))
    :cost 1
  )
)
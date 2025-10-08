(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:constants donna john billy - agent)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (free donna ?s) (free john ?s) (free billy ?s) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled ?s)
                 (not (free donna ?s)) (not (free john ?s)) (not (free billy ?s)))
  )
)
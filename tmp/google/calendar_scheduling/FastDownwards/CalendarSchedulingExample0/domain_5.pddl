(define (domain monday-ensemble)
  (:requirements :typing)
  (:types person slot)
  (:predicates
     (free ?p - person ?t - slot)
     (meeting_scheduled)
  )
  (:constants michelle steven jerry - person)
  (:action schedule_meeting
     :parameters (?s - slot)
     :precondition (and (free michelle ?s) (free steven ?s) (free jerry ?s) (not (meeting_scheduled)))
     :effect (and (not (free michelle ?s)) (not (free steven ?s)) (not (free jerry ?s)) (meeting_scheduled))
  )
)
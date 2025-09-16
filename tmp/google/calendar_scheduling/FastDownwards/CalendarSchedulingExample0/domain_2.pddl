(define (domain monday-ensemble)
  (:requirements :typing)
  (:types slot)
  (:predicates
     (free ?t - slot)
     (meeting-scheduled)
  )

  (:action schedule-slot
     :parameters (?s - slot)
     :precondition (free ?s)
     :effect (and (not (free ?s)) (meeting-scheduled))
  )
  
  (:action schedule-time-pair
     :parameters (?start - slot ?end - slot)
     :precondition (and (free ?start) (free ?end) (not (meeting-scheduled)))
     :effect (and (not (free ?start)) (not (free ?end)) (meeting-scheduled))
  )
)
(define (domain monday-ensemble)
  (:requirements :typing)
  (:types slot)
  (:predicates
     (free ?t - slot)
     (meeting_scheduled)
  )

  (:action schedule_slot
     :parameters (?s - slot)
     :precondition (free ?s)
     :effect (and (not (free ?s)) (meeting_scheduled))
  )

  (:action schedule_time_pair
     :parameters (?start - slot ?end - slot)
     :precondition (and (free ?start) (free ?end) (not (meeting_scheduled)))
     :effect (and (not (free ?start)) (not (free ?end)) (meeting_scheduled))
  )
)
(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants andrew grace samuel - person)
  (:predicates
    (at_slot ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )

  (:action advance
    :parameters (?s1 ?s2 - slot)
    :precondition (and (at_slot ?s1) (next_slot ?s1 ?s2))
    :effect (and (not (at_slot ?s1)) (at_slot ?s2))
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and 
      (at_slot ?s) 
      (available andrew ?s) 
      (available grace ?s) 
      (available samuel ?s)
    )
    :effect (meeting_scheduled)
  )
)
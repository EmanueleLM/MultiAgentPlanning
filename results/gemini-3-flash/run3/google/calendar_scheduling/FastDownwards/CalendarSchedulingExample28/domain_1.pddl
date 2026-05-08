(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot person)
  (:predicates
    (at_slot ?s - slot)
    (next ?s1 ?s2 - slot)
    (free ?p - person ?s - slot)
    (done)
  )

  (:action advance
    :parameters (?s1 ?s2 - slot)
    :precondition (and (at_slot ?s1) (next ?s1 ?s2))
    :effect (and (not (at_slot ?s1)) (at_slot ?s2))
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (at_slot ?s) 
                       (free brittany ?s) 
                       (free emily ?s) 
                       (free doris ?s))
    :effect (done)
  )
)
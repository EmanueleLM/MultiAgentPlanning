(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types time person)
  (:predicates
    (available ?person - person ?start - time ?end - time)
    (busy ?person - person ?start - time ?end - time)
    (checked ?start - time ?end - time)
    (meeting-scheduled ?start - time ?end - time)
    (next ?current - time ?next - time)
    (schedule-cost)
    (minimal-cost))
  
  (:action check-slot
    :parameters (?start - time ?end - time ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and 
        (available ?p1 ?start ?end)
        (available ?p2 ?start ?end)
        (available ?p3 ?start ?end)
        (not (checked ?start ?end)))
    :effect (and 
        (meeting-scheduled ?start ?end)
        (checked ?start ?end)))

  (:action increase-cost
    :parameters (?start - time ?end - time)
    :precondition (checked ?start ?end)
    :effect (and 
        (not (schedule-cost))
        (schedule-cost)))
  
  (:action set-min-cost
    :parameters ()
    :precondition (schedule-cost)
    :effect (minimal-cost))
)
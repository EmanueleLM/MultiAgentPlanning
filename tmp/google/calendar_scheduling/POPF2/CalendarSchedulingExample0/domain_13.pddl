(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time person)
  (:predicates
    (available ?person - person ?start - time)
    (available-till ?person - person ?end - time)
    (checked ?start - time ?end - time)
    (meeting-scheduled))

  (:action check-slot
    :parameters (?start - time ?end - time ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and 
        (available ?p1 ?start) (available-till ?p1 ?end)
        (available ?p2 ?start) (available-till ?p2 ?end)
        (available ?p3 ?start) (available-till ?p3 ?end)
        (not (checked ?start ?end)))
    :effect (and 
        (meeting-scheduled)
        (checked ?start ?end)))
)
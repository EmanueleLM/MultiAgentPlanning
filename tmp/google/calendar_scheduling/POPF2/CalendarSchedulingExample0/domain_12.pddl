(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time person)
  (:predicates
    (available ?person - person ?start - time)
    (available-till ?person - person ?end - time)
    (checked ?start - time ?end - time)
    (meeting-scheduled))

  (:action check-slot
    :parameters (?start - time ?end - time)
    :precondition (and 
        (available ?p1 - person ?start) (available-till ?p1 - person ?end)
        (available ?p2 - person ?start) (available-till ?p2 - person ?end)
        (available ?p3 - person ?start) (available-till ?p3 - person ?end)
        (not (checked ?start ?end)))
    :effect (and 
        (meeting-scheduled)
        (checked ?start ?end)))
)
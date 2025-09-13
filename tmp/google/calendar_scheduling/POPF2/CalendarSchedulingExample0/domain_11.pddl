(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types time person)
  (:predicates
    (available ?person - person ?start - time)
    (available-till ?person - person ?end - time)
    (checked ?start - time ?end - time)
    (meeting-scheduled))

  (:action check-slot
    :parameters (?start - time ?end - time)
    :precondition (and 
        (available michelle ?start) (available-till michelle ?end)
        (available steven ?start) (available-till steven ?end)
        (available jerry ?start) (available-till jerry ?end)
        (not (checked ?start ?end)))
    :effect (and 
        (meeting-scheduled)
        (checked ?start ?end)))
)
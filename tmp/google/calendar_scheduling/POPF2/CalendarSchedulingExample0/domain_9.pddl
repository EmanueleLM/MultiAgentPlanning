(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions :disjunctive-preconditions)
  (:types time person)
  (:predicates
    (available ?person - person ?start - time ?end - time)
    (busy ?person - person ?start - time ?end - time)
    (meeting-scheduled))

  (:action schedule
    :parameters (?person - person ?start - time ?end - time)
    :precondition (and 
                    (available ?person ?start ?end)
                    (not (busy ?person ?start ?end)))
    :effect (and 
              (meeting-scheduled)))
)
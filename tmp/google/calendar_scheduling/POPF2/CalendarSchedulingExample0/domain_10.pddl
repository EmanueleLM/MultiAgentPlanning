(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types time person)
  (:predicates
    (available ?person - person ?start - time ?end - time)
    (busy ?person - person ?start - time ?end - time)
    (free_interval ?start - time ?end - time)
    (meeting-scheduled))

  (:action find-time
    :parameters (?start - time ?end - time)
    :precondition (free_interval ?start ?end)
    :effect (meeting-scheduled))
)
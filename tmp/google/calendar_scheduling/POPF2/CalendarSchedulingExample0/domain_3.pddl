(define (domain combined-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types time person)
  (:predicates
    (available-agent1 ?time - time)
    (busy-agent2 ?p - person ?t1 - time ?t2 - time)
    (available-agent2 ?p - person ?start - time ?end - time)
    (free-agent3 ?time - time)
    (blocked-agent3 ?time - time)
    (meeting-scheduled ?time - time))

  (:action schedule-agent1
    :parameters (?time - time)
    :precondition (available-agent1 ?time)
    :effect (meeting-scheduled ?time))

  (:action schedule-agent2
    :parameters (?p - person ?start - time ?end - time)
    :precondition (and 
                    (available-agent2 ?p ?start ?end)
                    (not (busy-agent2 ?p ?start ?end)))
    :effect (meeting-scheduled ?start))

  (:action schedule-agent3
    :parameters (?time - time)
    :precondition (and (free-agent3 ?time) (not (blocked-agent3 ?time)))
    :effect (meeting-scheduled ?time))
)
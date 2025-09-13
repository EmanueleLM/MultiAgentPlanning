(define (domain combined-meeting-scheduling)
  (:predicates
    (available-agent1 ?time)
    (busy-agent2 ?p ?t1 ?t2)
    (available-agent2 ?p ?start ?end)
    (free-agent3 ?time)
    (blocked-agent3 ?time)
    (meeting-scheduled ?time))

  (:action schedule-agent1
    :parameters (?time)
    :precondition (available-agent1 ?time)
    :effect (meeting-scheduled ?time))

  (:action schedule-agent2
    :parameters (?p ?start ?end)
    :precondition (and 
                    (available-agent2 ?p ?start ?end)
                    (not (busy-agent2 ?p ?start ?end)))
    :effect (meeting-scheduled ?start))

  (:action schedule-agent3
    :parameters (?time)
    :precondition (and (free-agent3 ?time) (not (blocked-agent3 ?time)))
    :effect (meeting-scheduled ?time))
)
```
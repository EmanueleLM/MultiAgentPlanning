(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions :disjunctive-preconditions)
  (:types time person)
  (:predicates
    (available-michelle ?time - time)
    (busy-steven ?t1 - time ?t2 - time)
    (available-steven ?start - time ?end - time)
    (free-jerry ?time - time)
    (blocked-jerry ?time - time)
    (meeting-scheduled ?time - time))

  (:action schedule-michelle
    :parameters (?time - time)
    :precondition (available-michelle ?time)
    :effect (meeting-scheduled ?time))

  (:action schedule-steven
    :parameters (?start - time ?end - time)
    :precondition (and 
                    (available-steven ?start ?end)
                    (not (busy-steven ?start ?end)))
    :effect (meeting-scheduled ?start))

  (:action schedule-jerry
    :parameters (?time - time)
    :precondition (and (free-jerry ?time) (not (blocked-jerry ?time)))
    :effect (meeting-scheduled ?time))
)
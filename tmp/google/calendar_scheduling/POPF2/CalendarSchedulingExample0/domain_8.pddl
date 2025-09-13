(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :existential-preconditions :disjunctive-preconditions)
  (:types time person)
  (:predicates
    (available-michelle ?start - time ?end - time)
    (busy-michelle ?start - time ?end - time)
    (available-steven ?start - time ?end - time)
    (busy-steven ?start - time ?end - time)
    (available-jerry ?start - time ?end - time)
    (busy-jerry ?start - time ?end - time)
    (meeting-scheduled))

  (:action schedule-michelle
    :parameters (?start - time ?end - time)
    :precondition (and 
                    (available-michelle ?start ?end)
                    (not (busy-michelle ?start ?end)))
    :effect (meeting-scheduled))

  (:action schedule-steven
    :parameters (?start - time ?end - time)
    :precondition (and 
                    (available-steven ?start ?end)
                    (not (busy-steven ?start ?end)))
    :effect (meeting-scheduled))

  (:action schedule-jerry
    :parameters (?start - time ?end - time)
    :precondition (and 
                    (available-jerry ?start ?end)
                    (not (busy-jerry ?start ?end)))
    :effect (meeting-scheduled))
)
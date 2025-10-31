(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types slot person)
  (:predicates
    (free ?p - person ?s - slot)
    (preferred ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
    (has-confirmed ?p - person)
    (finalized)
    (scheduled ?s - slot)
  )

  (:action confirm-preferred
    :parameters (?p - person ?s - slot)
    :precondition (and (free ?p ?s) (preferred ?p ?s) (not (has-confirmed ?p)) (not (finalized)))
    :effect (and (confirmed ?p ?s) (has-confirmed ?p))
  )

  (:action confirm-nonpreferred
    :parameters (?p - person ?s - slot)
    :precondition (and (free ?p ?s) (not (preferred ?p ?s)) (not (has-confirmed ?p)) (not (finalized)))
    :effect (and (confirmed ?p ?s) (has-confirmed ?p))
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and
                    (confirmed agent1 ?s)
                    (confirmed agent2 ?s)
                    (confirmed agent3 ?s)
                    (confirmed agent4 ?s)
                    (confirmed agent5 ?s)
                    (confirmed agent6 ?s)
                    (confirmed agent7 ?s)
                    (not (finalized))
                  )
    :effect (and (finalized) (scheduled ?s))
  )
)
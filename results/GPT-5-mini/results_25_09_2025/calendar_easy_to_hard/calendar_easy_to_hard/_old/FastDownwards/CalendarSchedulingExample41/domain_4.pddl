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
    :parameters (?s - slot ?a1 - person ?a2 - person ?a3 - person ?a4 - person ?a5 - person ?a6 - person ?a7 - person)
    :precondition (and
                    (confirmed ?a1 ?s)
                    (confirmed ?a2 ?s)
                    (confirmed ?a3 ?s)
                    (confirmed ?a4 ?s)
                    (confirmed ?a5 ?s)
                    (confirmed ?a6 ?s)
                    (confirmed ?a7 ?s)
                    (not (finalized))
                  )
    :effect (and (finalized) (scheduled ?s))
  )
)
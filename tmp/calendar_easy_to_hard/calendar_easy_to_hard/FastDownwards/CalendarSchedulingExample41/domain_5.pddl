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
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person ?p4 - person ?p5 - person ?p6 - person ?p7 - person)
    :precondition (and
                    (confirmed ?p1 ?s)
                    (confirmed ?p2 ?s)
                    (confirmed ?p3 ?s)
                    (confirmed ?p4 ?s)
                    (confirmed ?p5 ?s)
                    (confirmed ?p6 ?s)
                    (confirmed ?p7 ?s)
                    (not (finalized))
                  )
    :effect (and (finalized) (scheduled ?s))
  )
)
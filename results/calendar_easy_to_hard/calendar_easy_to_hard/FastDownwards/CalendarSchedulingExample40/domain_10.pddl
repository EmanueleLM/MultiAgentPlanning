(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :universal-preconditions :disjunctive-preconditions)
  (:types participant slot)
  (:predicates
    (busy ?p - participant ?s - slot)
    (feasible ?s - slot)
    (assigned ?s - slot)
    (meeting-scheduled)
    (before ?s1 - slot ?s2 - slot)
    (rank1 ?s - slot) (rank2 ?s - slot) (rank3 ?s - slot) (rank4 ?s - slot)
    (rank5 ?s - slot) (rank6 ?s - slot) (rank7 ?s - slot) (rank8 ?s - slot)
    (rank9 ?s - slot) (rank10 ?s - slot) (rank11 ?s - slot) (rank12 ?s - slot)
    (rank13 ?s - slot) (rank14 ?s - slot) (rank15 ?s - slot) (rank16 ?s - slot)
  )

  (:action identify-feasible-rank1
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank1 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank2
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank2 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank3
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank3 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank4
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank4 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank5
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank5 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank6
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank6 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank7
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank7 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank8
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank8 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank9
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank9 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank10
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank10 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank11
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank11 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank12
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank12 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank13
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank13 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank14
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank14 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank15
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank15 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action identify-feasible-rank16
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (rank16 ?s)
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and (feasible ?s))
  )

  (:action assign-meeting
    :parameters (?s - slot)
    :precondition (and
      (feasible ?s)
      (not (meeting-scheduled))
      (forall (?t - slot) (or (not (before ?t ?s)) (not (feasible ?t))))
    )
    :effect (and (meeting-scheduled) (assigned ?s))
  )
)
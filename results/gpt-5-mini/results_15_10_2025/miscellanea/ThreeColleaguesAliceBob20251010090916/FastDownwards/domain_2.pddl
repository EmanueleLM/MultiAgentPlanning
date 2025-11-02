(define (domain three-colleagues-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)
    (scanned ?s - slot)
    (confirmed-alice ?s - slot)
    (confirmed-bob ?s - slot)
    (confirmed-carol ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (scheduled ?s - slot)
    (goal-met)
    (bob-morning ?s - slot)
  )

  (:action scan-orchestrator
    :parameters (?prev - slot ?s - slot)
    :precondition (and (scanned ?prev) (next ?prev ?s) (not (scanned ?s)))
    :effect (scanned ?s)
  )

  (:action confirm-alice
    :parameters (?s - slot)
    :precondition (and (scanned ?s) (available alice ?s) (not (confirmed-alice ?s)) (not (scheduled ?s)))
    :effect (confirmed-alice ?s)
  )

  (:action confirm-bob
    :parameters (?s - slot)
    :precondition (and (scanned ?s) (available bob ?s) (not (confirmed-bob ?s)) (not (scheduled ?s)))
    :effect (confirmed-bob ?s)
  )

  (:action confirm-carol
    :parameters (?s - slot)
    :precondition (and (scanned ?s) (available carol ?s) (not (confirmed-carol ?s)) (not (scheduled ?s)))
    :effect (confirmed-carol ?s)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (scanned ?s) (confirmed-alice ?s) (confirmed-bob ?s) (confirmed-carol ?s) (not (scheduled ?s)))
    :effect (and (scheduled ?s) (goal-met))
  )
)
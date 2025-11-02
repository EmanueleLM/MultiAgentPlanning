(define (domain three-colleagues-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)
    (checked ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (all-available ?s - slot)
    (bob-morning ?s - slot)
    (allowed-interrupt)
    (scheduled ?s - slot)
    (goal-met)
  )

  (:action check
    :parameters (?prev - slot ?s - slot)
    :precondition (and (checked ?prev) (next ?prev ?s) (not (checked ?s)))
    :effect (and (checked ?s))
  )

  (:action allow-interrupt
    :parameters ()
    :precondition (and (not (allowed-interrupt)))
    :effect (and (allowed-interrupt))
  )

  (:action schedule-no-interrupt
    :parameters (?s - slot)
    :precondition (and (checked ?s) (all-available ?s) (not (bob-morning ?s)))
    :effect (and (scheduled ?s) (goal-met))
  )

  (:action schedule-interrupt
    :parameters (?s - slot)
    :precondition (and (checked ?s) (all-available ?s) (bob-morning ?s) (allowed-interrupt))
    :effect (and (scheduled ?s) (goal-met))
  )
)
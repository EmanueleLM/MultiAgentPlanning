(define (domain schedule-orchestration-classical)
  (:requirements :typing :negative-preconditions :fluents)
  (:types agent location timepoint)
  (:constants traveler james - agent golden-gate-park marina - location)
  (:predicates
    (at ?a - agent ?l - location)
    (now ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (after16 ?t1 - timepoint ?t2 - timepoint)
    (after18 ?t1 - timepoint ?t2 - timepoint)
    (meet15-window ?t1 - timepoint ?t2 - timepoint)
    (met-james)
  )
  (:functions (total-meetings))

  (:action traveler-wait
    :parameters (?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (next ?t1 ?t2) (at traveler ?loc))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action james-wait
    :parameters (?loc - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (next ?t1 ?t2) (at james ?loc))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action traveler-travel-ggp-to-marina
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at traveler golden-gate-park) (after16 ?t1 ?t2))
    :effect (and
      (not (at traveler golden-gate-park))
      (at traveler marina)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action traveler-travel-marina-to-ggp
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at traveler marina) (after18 ?t1 ?t2))
    :effect (and
      (not (at traveler marina))
      (at traveler golden-gate-park)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action james-travel-ggp-to-marina
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at james golden-gate-park) (after16 ?t1 ?t2))
    :effect (and
      (not (at james golden-gate-park))
      (at james marina)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action james-travel-marina-to-ggp
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at james marina) (after18 ?t1 ?t2))
    :effect (and
      (not (at james marina))
      (at james golden-gate-park)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action meet-with-james
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (now ?t1)
      (at traveler marina)
      (at james marina)
      (meet15-window ?t1 ?t2)
      (not (met-james))
    )
    :effect (and
      (met-james)
      (increase (total-meetings) 1)
      (not (now ?t1))
      (now ?t2)
    )
  )
)
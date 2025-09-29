(define (domain schedule-orchestration-classical)
  (:requirements :typing :negative-preconditions)
  (:types agent location timepoint)
  (:constants golden-gate-park marina - location)
  (:predicates
    (at ?a - agent ?l - location)
    (now ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (after16 ?t1 - timepoint ?t2 - timepoint)
    (after18 ?t1 - timepoint ?t2 - timepoint)
    (meet15-window ?t1 - timepoint ?t2 - timepoint)
    (met-james)
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (next ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action travel-ggp-to-marina
    :parameters (?ag - agent ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at ?ag golden-gate-park) (after16 ?t1 ?t2))
    :effect (and
      (not (at ?ag golden-gate-park))
      (at ?ag marina)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action travel-marina-to-ggp
    :parameters (?ag - agent ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at ?ag marina) (after18 ?t1 ?t2))
    :effect (and
      (not (at ?ag marina))
      (at ?ag golden-gate-park)
      (not (now ?t1))
      (now ?t2)
    )
  )

  (:action meet-with-james
    :parameters (?ag - agent ?t1 - timepoint ?t2 - timepoint)
    :precondition (and (now ?t1) (at ?ag marina) (meet15-window ?t1 ?t2))
    :effect (and
      (met-james)
      (not (now ?t1))
      (now ?t2)
    )
  )
)
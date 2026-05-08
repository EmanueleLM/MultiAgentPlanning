(define (domain block-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)

  (:predicates
    (on ?b - block ?p - block)        ; block on top of another block
    (ontable ?b - block)             ; block on the table
    (clear ?b - block)               ; no block on top and not being held
    (handempty)
    (holding ?b - block)
    (at ?t - time)                   ; current stage/time marker
    (next ?t1 - time ?t2 - time)     ; ordering of stages
  )

  (:action unstack
    :parameters (?b - block ?p - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (on ?b ?p)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?p))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (clear ?p)
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action pickup-table
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action putdown-table
    :parameters (?b - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (ontable ?b)
      (clear ?b)
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action stack-onto
    :parameters (?b - block ?p - block ?t - time ?t2 - time)
    :precondition (and
      (at ?t)
      (next ?t ?t2)
      (holding ?b)
      (clear ?p)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?p)
      (not (clear ?p))
      (clear ?b)
      (not (at ?t))
      (at ?t2)
    )
  )
)
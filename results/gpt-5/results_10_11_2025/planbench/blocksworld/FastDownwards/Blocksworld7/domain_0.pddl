(define (domain blocks-audited)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pickup
    :parameters (?x - block)
    :precondition (and (handempty) (ontable ?x) (clear ?x))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (handempty))
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (handempty) (on ?x ?y) (clear ?x))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
    )
  )

  (:action putdown
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)
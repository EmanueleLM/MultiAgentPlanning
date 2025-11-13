(define (domain blocksworld2)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (clear ?x - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pickup
    :parameters (?x - block)
    :precondition (and (handempty) (clear ?x) (ontable ?x))
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
      (not (ontable ?x))
    )
  )

  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
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

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))
    )
  )
)
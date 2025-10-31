(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (not (on ?x ?y))
      (not (handempty))
      (holding ?x)
      (clear ?y)
      (not (clear ?x))
    )
  )

  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (not (ontable ?x))
      (not (handempty))
      (holding ?x)
      (not (clear ?x))
    )
  )

  (:action putdown
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and
      (not (holding ?x))
      (handempty)
      (ontable ?x)
      (clear ?x)
    )
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (not (holding ?x))
      (not (clear ?y))
      (on ?x ?y)
      (handempty)
      (clear ?x)
    )
  )
)
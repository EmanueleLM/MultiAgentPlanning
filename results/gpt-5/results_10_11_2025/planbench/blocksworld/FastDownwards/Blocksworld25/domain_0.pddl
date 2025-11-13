(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block hand)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pickup
    :parameters (?x - block)
    :precondition (and (clear ?x) (on-table ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action putdown
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
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
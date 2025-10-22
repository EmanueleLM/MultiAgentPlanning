(define (domain blocks)
  (:requirements :typing :negative-preconditions)
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
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
             (not (ontable ?x))
             (not (handempty))
             (holding ?x)
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

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
             (holding ?x)
             (clear ?y)
             (not (on ?x ?y))
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
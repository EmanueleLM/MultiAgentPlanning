(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pickup
    :parameters (?b - block)
    :precondition (and (clear ?b) (ontable ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action putdown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action unstack
    :parameters (?b ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action stack
    :parameters (?b ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
    )
  )
)
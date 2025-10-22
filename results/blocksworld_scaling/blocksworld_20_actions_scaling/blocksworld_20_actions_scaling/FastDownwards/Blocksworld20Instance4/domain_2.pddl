(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )

  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (handempty))
    )
  )

  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action unstack
    :parameters (?b - block ?support - block)
    :precondition (and (on ?b ?support) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?support)
      (not (on ?b ?support))
      (not (handempty))
    )
  )

  (:action stack
    :parameters (?b - block ?support - block)
    :precondition (and (holding ?b) (clear ?support))
    :effect (and
      (on ?b ?support)
      (clear ?b)
      (not (clear ?support))
      (handempty)
      (not (holding ?b))
    )
  )
)
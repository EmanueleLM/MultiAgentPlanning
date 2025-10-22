(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
  )

  (:action pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (handempty ?ag))
    )
  )

  (:action putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  (:action unstack
    :parameters (?ag - agent ?b - block ?support - block)
    :precondition (and (on ?b ?support) (clear ?b) (handempty ?ag))
    :effect (and
      (holding ?ag ?b)
      (clear ?support)
      (not (on ?b ?support))
      (not (handempty ?ag))
    )
  )

  (:action stack
    :parameters (?ag - agent ?b - block ?support - block)
    :precondition (and (holding ?ag ?b) (clear ?support))
    :effect (and
      (on ?b ?support)
      (clear ?b)
      (not (clear ?support))
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )
)
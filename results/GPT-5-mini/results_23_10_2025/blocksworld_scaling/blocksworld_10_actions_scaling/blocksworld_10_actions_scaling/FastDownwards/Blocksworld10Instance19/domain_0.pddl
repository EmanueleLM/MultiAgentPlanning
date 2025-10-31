(define (domain blocksworld-multi)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  (:action pickup
    :parameters (?ag - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?ag))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
    )
  )

  (:action putdown
    :parameters (?ag - agent ?x - block)
    :precondition (holding ?ag ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
    )
  )

  (:action stack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (holding ?ag ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?ag)
      (not (holding ?ag ?x))
    )
  )

  (:action unstack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?ag))
    :effect (and
      (holding ?ag ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty ?ag))
    )
  )
)
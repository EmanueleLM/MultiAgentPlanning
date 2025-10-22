(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
  )

  ;; Unstack a block ?x from block ?y by agent ?ag
  (:action unstack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty ?ag))
      (holding ?ag ?x)
    )
  )

  ;; Stack a held block ?x onto block ?y by agent ?ag
  (:action stack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and
      (holding ?ag ?x)
      (clear ?y)
    )
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
    )
  )

  ;; Put a held block ?x down on the table by agent ?ag
  (:action putdown
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (holding ?ag ?x)
    )
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)
    )
  )
)
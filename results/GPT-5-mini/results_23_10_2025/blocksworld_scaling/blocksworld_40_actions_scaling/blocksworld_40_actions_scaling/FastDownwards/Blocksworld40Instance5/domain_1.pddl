(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  ;; Pickup a block from the table by an agent
  (:action pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ;; Unstack a block from another block by an agent
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?ag))
    :effect (and
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?ag - agent ?b - block)
    :precondition (holding ?ag ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and (holding ?ag ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )
)
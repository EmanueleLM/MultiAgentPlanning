(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
  )

  ;; pickup: pick a clear block from the table
  (:action pickup
    :parameters (?ag - agent ?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty ?ag))
    :effect (and
      (holding ?ag ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
    )
  )

  ;; putdown: put a held block onto the table
  (:action putdown
    :parameters (?ag - agent ?x - block)
    :precondition (and (holding ?ag ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
    )
  )

  ;; unstack: take a clear block from on top of another block
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

  ;; stack: place a held block onto a clear block
  (:action stack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (holding ?ag ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
      (not (holding ?ag ?x))
      (not (clear ?y))
    )
  )
)
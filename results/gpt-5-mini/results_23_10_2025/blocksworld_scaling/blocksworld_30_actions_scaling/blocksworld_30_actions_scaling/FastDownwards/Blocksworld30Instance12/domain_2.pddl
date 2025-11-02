(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj block agent)
  (:predicates
    (on ?x - block ?y - obj)
    (clear ?x - block)
    (handempty ?a - agent)
    (holding ?a - agent ?x - block)
  )

  (:action pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (on ?x table) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (not (on ?x table))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  (:action putdown
    :parameters (?a - agent ?x - block)
    :precondition (and (holding ?a ?x))
    :effect (and
      (on ?x table)
      (clear ?x)
      (handempty ?a)
      (not (holding ?a ?x))
    )
  )

  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  (:action stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?a)
      (not (clear ?y))
      (not (holding ?a ?x))
    )
  )
)
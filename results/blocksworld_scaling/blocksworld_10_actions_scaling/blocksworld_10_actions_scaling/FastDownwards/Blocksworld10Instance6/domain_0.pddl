(define (domain blocksworld-multiagent)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  ;; Standard blocksworld actions parameterized by agent
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
              (not (on ?x ?y))
              (holding ?a ?x)
              (clear ?y)
              (not (handempty ?a))
            )
  )

  (:action stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (holding ?a ?x) (clear ?y))
    :effect (and
              (not (holding ?a ?x))
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (handempty ?a)
            )
  )

  (:action putdown
    :parameters (?a - agent ?x - block)
    :precondition (holding ?a ?x)
    :effect (and
              (not (holding ?a ?x))
              (on-table ?x)
              (handempty ?a)
              (clear ?x)
            )
  )

  (:action pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (on-table ?x) (clear ?x) (handempty ?a))
    :effect (and
              (not (on-table ?x))
              (holding ?a ?x)
              (not (handempty ?a))
            )
  )
)
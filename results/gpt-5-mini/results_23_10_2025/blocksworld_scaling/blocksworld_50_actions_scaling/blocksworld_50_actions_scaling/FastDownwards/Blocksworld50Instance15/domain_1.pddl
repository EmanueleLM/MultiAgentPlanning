(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
  )

  ;; pickup a block from the table by an agent
  (:action pickup
    :parameters (?ag - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?ag))
    :effect (and
              (holding ?ag ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty ?ag))
            )
  )

  ;; putdown a block (held) to the table by an agent
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

  ;; unstack: take top block ?x from block ?y
  (:action unstack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?ag))
    :effect (and
              (holding ?ag ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (handempty ?ag))
            )
  )

  ;; stack: put held block ?x onto block ?y
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
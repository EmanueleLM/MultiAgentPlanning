(define (domain blocks_world)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    ;; Types
    (block ?b - block)
    (agent ?a - agent)

    ;; World state
    (handempty ?a - agent)         ;; agent has empty hand
    (holding ?a - agent ?b - block) ;; agent is holding block

    (on ?b - block ?support - block) ;; block b is on block support
    (on-table ?b - block)            ;; block b is on the table

    (clear ?b - block)               ;; nothing on top of b
  )

  ;; pick-up: take a block from the table into the agent's hand
  (:action pick-up
    :parameters (?a - agent ?b - block)
    :precondition (and
      (handempty ?a)
      (clear ?b)
      (on-table ?b)
      (block ?b)
      (agent ?a)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  ;; unstack: take a block b from on top of block c
  (:action unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (handempty ?a)
      (on ?b ?c)
      (clear ?b)
      (block ?b)
      (block ?c)
      (agent ?a)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?c)
    )
  )

  ;; put-down: place a held block onto the table
  (:action put-down
    :parameters (?a - agent ?b - block)
    :precondition (and
      (holding ?a ?b)
      (block ?b)
      (agent ?a)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
    )
  )

  ;; stack: place a held block b onto another block c
  (:action stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (holding ?a ?b)
      (clear ?c)
      (block ?b)
      (block ?c)
      (agent ?a)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?a)
      (not (holding ?a ?b))
      (not (clear ?c))
    )
  )
)
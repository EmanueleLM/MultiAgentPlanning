(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (clear ?b - block)
  )

  ;; PickUp can only be done when hand is empty and the block is on the table and clear.
  ;; After PickUp the agent is holding the block and hand is not empty; block is no longer on-table.
  (:action pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and (handempty ?ag) (on-table ?b) (clear ?b))
    :effect (and
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (on-table ?b))
            )
  )

  ;; Unstack can only be done when hand is empty and the block to unstack is on top of another block and clear.
  ;; After Unstack the agent is holding the block, hand is not empty, the below block becomes clear, and the on relation is removed.
  (:action unstack
    :parameters (?ag - agent ?b - block ?below - block)
    :precondition (and (handempty ?ag) (on ?b ?below) (clear ?b))
    :effect (and
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?below)
              (not (on ?b ?below))
            )
  )

  ;; PutDown can only be done when the agent is holding the block.
  ;; After PutDown the agent hand becomes empty and the block is on the table and clear.
  (:action putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
              (handempty ?ag)
              (not (holding ?ag ?b))
              (on-table ?b)
              (clear ?b)
            )
  )

  ;; Stack can only be done when the agent is holding the block and the destination block is clear.
  ;; After Stack the agent hand becomes empty; the held block is on the destination and the destination becomes not clear.
  (:action stack
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and (holding ?ag ?b) (clear ?dest))
    :effect (and
              (handempty ?ag)
              (not (holding ?ag ?b))
              (on ?b ?dest)
              (not (clear ?dest))
              (clear ?b)
            )
  )
)
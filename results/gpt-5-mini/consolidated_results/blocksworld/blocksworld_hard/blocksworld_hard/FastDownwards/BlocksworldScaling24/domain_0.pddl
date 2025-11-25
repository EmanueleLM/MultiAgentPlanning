(define (domain stacking-multiagent)
  ;; Blocks-world domain for a single agent "orchestrator".
  ;; Types and requirements compatible with Fast Downward.
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on ?y (both blocks)
    (ontable ?x - block)              ; ?x is directly on the table
    (clear ?x - block)                ; nothing on top of ?x
    (holding ?a - agent ?x - block)   ; agent ?a is holding block ?x
    (handempty ?a - agent)            ; agent ?a has empty hand
  )

  ;; ACTION: pickup a block from the table
  ;; Preconditions: the block is on the table, clear, and the agent's hand is empty.
  ;; Effects: agent holds the block; block no longer on table or clear; hand no longer empty.
  (:action pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and
              (holding ?a ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty ?a))
             )
  )

  ;; ACTION: putdown a block onto the table
  ;; Preconditions: agent is holding the block.
  ;; Effects: block is on the table and clear; agent's hand becomes empty; agent no longer holding.
  (:action putdown
    :parameters (?a - agent ?x - block)
    :precondition (holding ?a ?x)
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty ?a)
              (not (holding ?a ?x))
             )
  )

  ;; ACTION: unstack a block from another block
  ;; Preconditions: block ?x is on block ?y, ?x is clear, agent's hand empty.
  ;; Effects: agent holds ?x; ?x is no longer on ?y; ?y becomes clear; agent's hand no longer empty.
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
              (holding ?a ?x)
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
              (not (handempty ?a))
             )
  )

  ;; ACTION: stack a block onto another block
  ;; Preconditions: agent is holding ?x and ?y is clear.
  ;; Effects: ?x is on ?y; ?x becomes clear; ?y no longer clear; agent's hand empty; agent no longer holding ?x.
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
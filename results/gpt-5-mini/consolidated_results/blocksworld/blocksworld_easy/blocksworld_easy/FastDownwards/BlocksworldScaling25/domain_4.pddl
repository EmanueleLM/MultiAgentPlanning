(define (domain blocksworld_merged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table stage - object)

  (:predicates
    ;; a block is located on either a table object or another block
    (on ?b - block ?x - object)
    ;; block has nothing on top of it and is not being held
    (clear ?b - block)
    ;; agent is holding this block
    (holding ?b - block)
    ;; agent's hand is empty
    (handempty)
    ;; which stage/timepoint is currently active
    (stage-active ?s - stage)
    ;; successor relation between stages (ordering)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a block from the table:
  ;; pre: block is on a specified table, block is clear, hand is empty, current stage is active and has a successor
  ;; effect: agent holds the block, the block is no longer on the table, the block is not clear (being held), hand is not empty,
  ;;         advance stage-active to successor
  (:action planner_pickup_from_table
    :parameters (?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?t)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Unstack a block from another block:
  ;; pre: the block is on top of another block, the top block is clear, hand is empty, stage ordering
  ;; effect: agent holds the block, it is no longer on the supporting block, the supporting block becomes clear,
  ;;         the moved block is not clear (being held), hand becomes non-empty, advance stage
  (:action planner_unstack_from_block
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Put down a held block onto a table:
  ;; pre: agent is holding the block, stage ordering
  ;; effect: block is on the specified table, block becomes clear, hand becomes empty, agent no longer holds the block, advance stage
  (:action auditor_put_down_on_table
    :parameters (?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Stack a held block onto another block:
  ;; pre: agent holds the moving block, destination block is clear, stage ordering
  ;; effect: moving block is on the destination block, moving block becomes clear (no block on top),
  ;;         destination block becomes not clear, hand becomes empty, agent no longer holds the block, advance stage
  (:action auditor_stack_on_block
    :parameters (?b - block ?dest - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?dest)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?dest)
      (clear ?b)
      (not (clear ?dest))
      (handempty)
      (not (holding ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)
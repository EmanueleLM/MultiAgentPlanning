(define (domain blocksworld_merged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates
  (:predicates
    (on ?x - obj ?y - obj)         ; ?x (a block) is on ?y (a block or table)
    (clear ?x - obj)              ; ?x (a block) has nothing on it
    (holding ?x - obj)            ; robot is holding ?x (a block)
    (handempty)                   ; robot's hand is empty
    (block ?x - obj)              ; unary predicate identifying blocks
    (table ?x - obj)              ; unary predicate identifying the table object
  )

  ;; Action: Pick up a block from the table
  ;; Origin tag: planner_pickup_from_table_orig
  (:action planner_pickup_from_table_orig
    :parameters (?b - obj ?t - obj)
    :precondition (and
      (block ?b)
      (table ?t)
      (on ?b ?t)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (handempty))
      (not (clear ?b))
    )
  )

  ;; Action: Unstack a block from another block
  ;; Origin tag: planner_unstack_from_block_orig
  (:action planner_unstack_from_block_orig
    :parameters (?b - obj ?b2 - obj)
    :precondition (and
      (block ?b)
      (block ?b2)
      (on ?b ?b2)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?b2))
      (clear ?b2)
      (not (handempty))
      (not (clear ?b))
    )
  )

  ;; Action: Put down a held block onto the table
  ;; Origin tag: auditor_put_down_on_table_audited
  (:action auditor_put_down_on_table_audited
    :parameters (?b - obj ?t - obj)
    :precondition (and
      (block ?b)
      (table ?t)
      (holding ?b)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Action: Stack a held block onto another block
  ;; Origin tag: auditor_stack_on_block_audited
  (:action auditor_stack_on_block_audited
    :parameters (?b - obj ?b2 - obj)
    :precondition (and
      (block ?b)
      (block ?b2)
      (holding ?b)
      (clear ?b2)
    )
    :effect (and
      (on ?b ?b2)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?b2))
    )
  )
)
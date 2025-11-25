(define (domain blocksworld_merged)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ;; Predicates
  (:predicates
    (on ?x - obj ?y - obj)         ; block ?x is on block or table ?y
    (clear ?x - obj)              ; ?x has nothing on it and is not held
    (holding ?x - obj)            ; robot is holding ?x
    (handempty)                   ; robot's hand is empty
    (block ?x - obj)              ; identifies blocks
    (table ?x - obj)              ; identifies the table object(s)
    (stage-active ?s - obj)       ; which stage is currently active (sequencing)
    (next ?s - obj ?s2 - obj)     ; successor relation for stages
    (stage ?s - obj)              ; identifies stage objects
  )

  ;; Action: Pick up a block from the table
  (:action planner_pickup_from_table_orig
    :parameters (?b - obj ?t - obj ?s - obj ?s2 - obj)
    :precondition (and
      (block ?b)
      (table ?t)
      (on ?b ?t)
      (clear ?b)
      (handempty)
      (stage ?s)
      (stage ?s2)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (handempty))
      (not (clear ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Action: Unstack a block from another block
  (:action planner_unstack_from_block_orig
    :parameters (?b - obj ?b2 - obj ?s - obj ?s2 - obj)
    :precondition (and
      (block ?b)
      (block ?b2)
      (on ?b ?b2)
      (clear ?b)
      (handempty)
      (stage ?s)
      (stage ?s2)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?b2))
      (clear ?b2)
      (not (handempty))
      (not (clear ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Action: Put down a held block onto the table
  (:action auditor_put_down_on_table_audited
    :parameters (?b - obj ?t - obj ?s - obj ?s2 - obj)
    :precondition (and
      (block ?b)
      (table ?t)
      (holding ?b)
      (stage ?s)
      (stage ?s2)
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

  ;; Action: Stack a held block onto another block
  (:action auditor_stack_on_block_audited
    :parameters (?b - obj ?b2 - obj ?s - obj ?s2 - obj)
    :precondition (and
      (block ?b)
      (block ?b2)
      (holding ?b)
      (clear ?b2)
      (stage ?s)
      (stage ?s2)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?b2)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?b2))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)
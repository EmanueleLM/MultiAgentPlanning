(define (domain blocksworld_merged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table stage - object)

  (:predicates
    (on ?b - block ?x - object)      ; block ?b is on block or on table ?x
    (clear ?b - block)              ; ?b has nothing on it and is not held
    (holding ?b - block)            ; robot is holding block ?b
    (handempty)                     ; robot's hand is empty
    (stage-active ?s - stage)       ; which stage is currently active
    (next ?s - stage ?s2 - stage)   ; successor relation for stages
  )

  ;; Pick up a block from the table (requires hand empty and the block clear)
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
      (not (handempty))
      (not (clear ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Unstack a block from on top of another block (requires hand empty and the top block clear)
  (:action planner_unstack_from_block
    :parameters (?b - block ?b2 - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?b2)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?b2))
      (not (handempty))
      (not (clear ?b))
      (clear ?b2)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Put down a held block onto the table (requires holding the block)
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

  ;; Stack a held block onto another block (requires holding the block and destination block clear)
  (:action auditor_stack_on_block
    :parameters (?b - block ?b2 - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?b2)
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
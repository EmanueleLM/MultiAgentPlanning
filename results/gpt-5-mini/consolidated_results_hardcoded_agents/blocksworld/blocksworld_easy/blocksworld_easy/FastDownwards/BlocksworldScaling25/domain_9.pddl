(define (domain blocksworld_strict)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table stage)

  (:predicates
    (on-table ?b - block ?t - table)
    (on ?b - block ?below - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (stage-active ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a block from the table.
  (:action planner_pickup_from_table
    :parameters (?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (on-table ?b ?t)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b ?t))
      (not (clear ?b))
      (not (handempty))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Unstack a block from another block.
  (:action planner_unstack_from_block
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
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

  ;; Put down a held block onto a table.
  (:action auditor_put_down_on_table
    :parameters (?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
    )
    :effect (and
      (on-table ?b ?t)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )

  ;; Stack a held block onto another block.
  (:action auditor_stack_on_block
    :parameters (?b - block ?dest - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?dest)
      (stage-active ?s)
      (next ?s ?s2)
      (not (stage-active ?s2))
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
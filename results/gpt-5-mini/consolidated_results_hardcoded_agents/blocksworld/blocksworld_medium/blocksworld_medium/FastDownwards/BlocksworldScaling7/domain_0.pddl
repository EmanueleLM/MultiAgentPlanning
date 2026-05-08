(define (domain multi-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (transferred ?b - block)
  )

  ;; Picker actions: pick block from table, unstack from another block, hand over to stacker.
  (:action picker-pick-from-table
    :parameters (?b - block ?ag - agent)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action picker-unstack
    :parameters (?b - block ?below - block ?ag - agent)
    :precondition (and
      (on ?b ?below)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action picker-handover-to-stacker
    :parameters (?b - block ?picker - agent ?stacker - agent)
    :precondition (and
      (holding ?picker ?b)
      (handempty ?stacker)
    )
    :effect (and
      (not (holding ?picker ?b))
      (handempty ?picker)
      (holding ?stacker ?b)
      (not (handempty ?stacker))
      (transferred ?b)
    )
  )

  ;; Stacker actions: place a transferred block onto another block, or put down on table.
  (:action stacker-place-on
    :parameters (?b - block ?target - block ?ag - agent)
    :precondition (and
      (holding ?ag ?b)
      (clear ?target)
      (transferred ?b)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding ?ag ?b))
      (handempty ?ag)
      (not (transferred ?b))
    )
  )

  (:action stacker-put-down
    :parameters (?b - block ?ag - agent)
    :precondition (and
      (holding ?ag ?b)
      (transferred ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
      (not (transferred ?b))
    )
  )
)
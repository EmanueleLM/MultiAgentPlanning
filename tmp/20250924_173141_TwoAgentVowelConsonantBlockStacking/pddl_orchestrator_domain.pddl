(define (domain multiagent-blocks-orchestrator)
  (:requirements :strips :typing)
  (:types agent block slot)
  (:predicates
    (can-pick ?a - agent ?b - block)
    (on ?b - block ?below - block)
    (ontable ?b - block ?s - slot)
    (top ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (empty-slot ?s - slot)
  )

  ;; pick up a top block that is on another block
  (:action pick-up-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (on ?b ?below)
      (top ?b)
      (handempty ?a)
      (can-pick ?a ?b)
    )
    :effect (and
      (not (on ?b ?below))
      (holding ?a ?b)
      (not (handempty ?a))
      (top ?below)
      (not (top ?b))
    )
  )

  ;; pick up a top block that is on the table (root of a slot)
  (:action pick-up-from-table
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (ontable ?b ?s)
      (top ?b)
      (handempty ?a)
      (can-pick ?a ?b)
    )
    :effect (and
      (not (ontable ?b ?s))
      (holding ?a ?b)
      (not (handempty ?a))
      (empty-slot ?s)
      (not (top ?b))
    )
  )

  ;; put a held block onto another block (must be top and not held by any agent)
  (:action put-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (holding ?a ?b)
      (top ?target)
      (not (holding vowel_agent ?target))
      (not (holding consonant_agent ?target))
    )
    :effect (and
      (on ?b ?target)
      (not (top ?target))
      (top ?b)
      (not (holding ?a ?b))
      (handempty ?a)
    )
  )

  ;; put a held block down to an empty table slot (creates a new root there)
  (:action put-down-to-table
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (holding ?a ?b)
      (empty-slot ?s)
    )
    :effect (and
      (ontable ?b ?s)
      (not (empty-slot ?s))
      (top ?b)
      (not (holding ?a ?b))
      (handempty ?a)
    )
  )
)
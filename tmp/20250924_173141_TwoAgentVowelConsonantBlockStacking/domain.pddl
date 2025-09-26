(define (domain multiagent-blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block slot)
  (:predicates
    (can-pick ?a - agent ?b - block)
    (on ?b - block ?below - block)
    (ontable ?b - block ?s - slot)
    (top ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (empty-slot ?s - slot)
    (not-held ?b - block)
  )

  (:action pick-up-from-block
    :parameters (?a - agent ?b - block ?below - block)
    :precondition (and
      (on ?b ?below)
      (top ?b)
      (handempty ?a)
      (can-pick ?a ?b)
      (not-held ?b)
    )
    :effect (and
      (not (on ?b ?below))
      (holding ?a ?b)
      (not (handempty ?a))
      (top ?below)
      (not (top ?b))
      (not (not-held ?b))
    )
  )

  (:action pick-up-from-table
    :parameters (?a - agent ?b - block ?s - slot)
    :precondition (and
      (ontable ?b ?s)
      (top ?b)
      (handempty ?a)
      (can-pick ?a ?b)
      (not-held ?b)
    )
    :effect (and
      (not (ontable ?b ?s))
      (holding ?a ?b)
      (not (handempty ?a))
      (empty-slot ?s)
      (not (top ?b))
      (not (not-held ?b))
    )
  )

  (:action put-on-block
    :parameters (?a - agent ?b - block ?target - block)
    :precondition (and
      (holding ?a ?b)
      (top ?target)
      (not-held ?target)
    )
    :effect (and
      (on ?b ?target)
      (not (top ?target))
      (top ?b)
      (not (holding ?a ?b))
      (handempty ?a)
      (not-held ?b)
    )
  )

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
      (not-held ?b)
    )
  )
)
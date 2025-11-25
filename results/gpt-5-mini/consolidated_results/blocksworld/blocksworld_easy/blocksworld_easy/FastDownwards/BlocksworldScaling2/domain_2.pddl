(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block picker_agent stacker_agent auditor_agent orchestrator_agent - agent)

  (:predicates
    (on ?b - block ?c - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (handfree)
  )

  (:action picker-pickup
    :parameters (?a - picker_agent ?b - block)
    :precondition (and (handfree) (handempty ?a) (ontable ?b) (clear ?b))
    :effect (and
      (not (handfree))
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?a ?b)
      (not (handempty ?a))
    )
  )

  (:action picker-unstack
    :parameters (?a - picker_agent ?b - block ?c - block)
    :precondition (and (handfree) (handempty ?a) (on ?b ?c) (clear ?b))
    :effect (and
      (not (handfree))
      (not (on ?b ?c))
      (holding ?a ?b)
      (clear ?c)
      (not (clear ?b))
      (not (handempty ?a))
    )
  )

  (:action picker-putdown
    :parameters (?a - picker_agent ?b - block)
    :precondition (holding ?a ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?a ?b))
      (handfree)
      (handempty ?a)
    )
  )

  (:action picker-stack
    :parameters (?a - picker_agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding ?a ?b))
      (handfree)
      (handempty ?a)
    )
  )

  (:action stacker-pickup
    :parameters (?a - stacker_agent ?b - block)
    :precondition (and (handfree) (handempty ?a) (ontable ?b) (clear ?b))
    :effect (and
      (not (handfree))
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?a ?b)
      (not (handempty ?a))
    )
  )

  (:action stacker-unstack
    :parameters (?a - stacker_agent ?b - block ?c - block)
    :precondition (and (handfree) (handempty ?a) (on ?b ?c) (clear ?b))
    :effect (and
      (not (handfree))
      (not (on ?b ?c))
      (holding ?a ?b)
      (clear ?c)
      (not (clear ?b))
      (not (handempty ?a))
    )
  )

  (:action stacker-putdown
    :parameters (?a - stacker_agent ?b - block)
    :precondition (holding ?a ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?a ?b))
      (handfree)
      (handempty ?a)
    )
  )

  (:action stacker-stack
    :parameters (?a - stacker_agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding ?a ?b))
      (handfree)
      (handempty ?a)
    )
  )
)
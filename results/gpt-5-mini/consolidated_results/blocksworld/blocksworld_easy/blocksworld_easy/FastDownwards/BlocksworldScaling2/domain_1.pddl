(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)
  (:predicates
    (on ?b - block ?c - block)        ; ?b is directly on ?c
    (ontable ?b - block)              ; ?b is on the table
    (clear ?b - block)                ; nothing is on top of ?b AND ?b is not held
    (holding ?a - agent ?b - block)   ; agent ?a is holding block ?b
    (handempty ?a - agent)            ; agent ?a's hand is empty (agent-local)
    (handfree)                        ; the single shared manipulator is free (global resource)
  )

  ; Picker actions (agent-specific names preserved)
  (:action picker-pickup
    :parameters (?a - agent ?b - block)
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
    :parameters (?a - agent ?b - block ?c - block)
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
    :parameters (?a - agent ?b - block)
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
    :parameters (?a - agent ?b - block ?c - block)
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

  ; Stacker actions (agent-specific duplicates, same semantics)
  (:action stacker-pickup
    :parameters (?a - agent ?b - block)
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
    :parameters (?a - agent ?b - block ?c - block)
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
    :parameters (?a - agent ?b - block)
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
    :parameters (?a - agent ?b - block ?c - block)
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
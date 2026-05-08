(define (domain block-stacking-collab)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)
  (:predicates
    (on ?b - block ?c - block)       ; block ?b is directly on block ?c
    (ontable ?b - block)             ; block ?b is on the table
    (clear ?b - block)               ; nothing is on top of block ?b
    (holding ?a - agent ?b - block)  ; agent ?a is holding block ?b
    (handempty ?a - agent)           ; agent ?a has an empty hand (not holding)
    (handfree)                       ; the single shared manipulator is free
  )

  ; Picker actions
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

  ; Stacker actions
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
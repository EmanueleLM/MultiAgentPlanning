(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (clear ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (holding ?b - block)
    (handempty)
  )

  ;; Pickup a block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (clear ?b) (on-table ?b) (handempty))
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; Unstack a block from another block
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )

  ;; Put the held block down on the table
  (:action putdown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (not (holding ?b))
      (on-table ?b)
      (clear ?b)
      (handempty)
    )
  )

  ;; Stack the held block onto another block
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
  )
)
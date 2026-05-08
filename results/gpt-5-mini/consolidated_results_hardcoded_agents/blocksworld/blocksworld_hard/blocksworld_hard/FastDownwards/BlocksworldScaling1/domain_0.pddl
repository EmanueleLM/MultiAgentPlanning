(define (domain blocks-world-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
  )

  ;; pick up a block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and
      (handempty)
      (clear ?b)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; unstack a block ?b from on top of block ?c
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (handempty)
      (clear ?b)
      (on ?b ?c)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )

  ;; put down a held block onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; stack a held block ?b onto block ?c
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
    )
  )
)
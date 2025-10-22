(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; block x is on block y
    (ontable ?x - block)            ; block x is on the table
    (clear ?x - block)              ; nothing is on block x
    (holding ?x - block)            ; the agent is holding block x
    (handempty)                     ; the agent's hand is empty
  )

  ;; Pickup a block from the table into the hand
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (not (holding ?x))
      (handempty)
      (ontable ?x)
      (clear ?x)
    )
  )

  ;; Unstack a block from another block into the hand
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (not (on ?x ?y))
      (not (handempty))
      (holding ?x)
      (clear ?y)
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (not (holding ?x))
      (handempty)
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (ontable ?x))
    )
  )
)
(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)     ; block x is on block y
    (on-table ?x - block)          ; block x is directly on the table
    (clear ?x - block)             ; nothing is on top of block x
    (holding ?x - block)           ; the agent is holding block x
    (handempty)                    ; the agent's hand is empty
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (on-table ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (handempty))
    )
  )

  ;; Unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
    )
  )

  ;; Put a held block down onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
    )
  )
)
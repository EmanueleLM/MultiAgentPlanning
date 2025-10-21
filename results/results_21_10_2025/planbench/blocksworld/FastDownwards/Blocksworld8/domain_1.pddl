(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)       ; ?x is directly on ?y
    (ontable ?x - block)             ; ?x is on the table
    (clear ?x - block)               ; no block on top of ?x and it is not being held
    (holding ?x - block)             ; the agent is holding ?x
    (handempty)                      ; the agent's hand is empty
  )

  ;; Pick up a block from the table
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; Unstack a block from on top of another block
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

  ;; Put a held block down on the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
    )
  )
)
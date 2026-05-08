(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on ?y
    (ontable ?x - block)             ; ?x is on the table
    (clear ?x - block)               ; nothing is on ?x and it is not being held
    (holding ?x - block)             ; the agent is holding ?x
    (handempty)                      ; the agent's hand is empty
  )

  ;; pick-up a clear block from the table
  (:action pick-up
    :parameters (?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; unstack a clear block from another block
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))   ; block being held is not considered clear
      (not (handempty))
      (holding ?b)
      (clear ?c)         ; the block underneath becomes clear
    )
  )

  ;; put down a held block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
  )

  ;; stack a held block onto a clear block
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))  ; the destination is no longer clear after stacking
      (handempty)
      (on ?b ?c)
      (not (ontable ?b))
      (not (clear ?b))  ; the moved block is not clear while considered placed (no block on top)
    )
  )
)
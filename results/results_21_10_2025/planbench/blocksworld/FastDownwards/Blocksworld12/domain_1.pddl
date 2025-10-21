(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (ontable ?b - block)    ; block is directly on the table
    (on ?b - block ?b2 - block) ; ?b is on top of ?b2
    (clear ?b - block)      ; nothing on top of ?b and it is not being held
    (holding ?b - block)    ; agent is holding ?b
    (handempty)             ; agent's hand is empty
  )

  ;; pickup: pick up a clear block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
            )
  )

  ;; unstack: pick up a clear block from on top of another block
  (:action unstack
    :parameters (?b - block ?b2 - block)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty))
    :effect (and
              (not (on ?b ?b2))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
              (clear ?b2)
            )
  )

  ;; putdown: put the held block onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; stack: place a held block onto a clear block
  (:action stack
    :parameters (?b - block ?b2 - block)
    :precondition (and (holding ?b) (clear ?b2))
    :effect (and
              (on ?b ?b2)
              (clear ?b)
              (not (clear ?b2))
              (handempty)
              (not (holding ?b))
            )
  )
)
(define (domain blocks-world)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?b2 - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
  )

  ;; pickup: pick up a block from the table
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

  ;; unstack: pick up a block from on top of another block
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

  ;; putdown: put a held block down onto the table
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

  ;; stack: place a held block on top of another clear block
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
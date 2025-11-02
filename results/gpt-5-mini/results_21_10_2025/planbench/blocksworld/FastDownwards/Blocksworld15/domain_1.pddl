(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)      ; ?b is on ?x (block)
    (on-table ?b - block)           ; ?b is on the table
    (clear ?b - block)              ; nothing on top of ?b
    (handempty)                     ; the (single) hand is empty
    (holding ?b - block)            ; the (single) hand is holding ?b
  )

  ;; Pick up a clear block from the table when the hand is empty and the block is not already held
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (handempty) (on-table ?b) (clear ?b) (not (holding ?b)))
    :effect (and
              (holding ?b)
              (not (handempty))
              (not (on-table ?b))
              (not (clear ?b))
            )
  )

  ;; Unstack a clear block from another block when the hand is empty and the block is not already held
  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (handempty) (on ?b ?x) (clear ?b) (not (holding ?b)))
    :effect (and
              (holding ?b)
              (not (handempty))
              (clear ?x)
              (not (on ?b ?x))
              (not (clear ?b))
            )
  )

  ;; Put down a held block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (handempty)
              (not (holding ?b))
              (on-table ?b)
              (clear ?b)
            )
  )

  ;; Stack a held block onto a clear destination block
  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
              (not (holding ?b))
              (handempty)
              (on ?b ?x)
              (not (clear ?x))
              (clear ?b)
              (not (on-table ?b))
            )
  )
)
(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Pick up a clear block from the table when the hand is empty
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (handempty) (on-table ?b) (clear ?b))
    :effect (and
              (holding ?b)
              (not (on-table ?b))
              (not (handempty))
              (not (clear ?b))
            )
  )

  ;; Unstack a clear block from another block when the hand is empty
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (handempty) (on ?b ?c) (clear ?b))
    :effect (and
              (holding ?b)
              (clear ?c)
              (not (on ?b ?c))
              (not (handempty))
              (not (clear ?b))
            )
  )

  ;; Put down a held block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (on-table ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; Stack a held block onto a clear block
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
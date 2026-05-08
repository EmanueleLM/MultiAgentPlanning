(define (domain BlocksworldScaling3)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?b - block ?b2 - block)
    (on-table ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (hand-empty)
  )

  ;; Pick up a clear block from the table into the hand.
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (on-table ?b) (clear ?b) (hand-empty))
    :effect (and
      (holding ?b)
      (not (on-table ?b))
      (not (clear ?b))
      (not (hand-empty))
    )
  )

  ;; Unstack a clear block from on top of another block into the hand.
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (hand-empty))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (hand-empty))
    )
  )

  ;; Put the held block down onto the table.
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (on-table ?b)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
    )
  )

  ;; Stack the held block onto a clear block.
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (hand-empty)
      (not (holding ?b))
    )
  )
)
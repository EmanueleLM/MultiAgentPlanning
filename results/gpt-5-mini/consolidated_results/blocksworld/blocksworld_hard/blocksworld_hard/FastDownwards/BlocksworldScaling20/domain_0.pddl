(define (domain blocks-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (hand-empty)
    (holding ?b - block)
    (clear ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
  )

  ;; Pick up a clear block from the table into the hand
  (:action pick-up
    :parameters (?b - block)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (hand-empty)
    )
    :effect (and
      (holding ?b)
      (not (on-table ?b))
      (not (hand-empty))
      ;; ?b remains clear while held (no change to clear ?b)
    )
  )

  ;; Unstack a clear block from another block into the hand
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (hand-empty)
    )
    :effect (and
      (holding ?b)
      (clear ?c)           ;; removing ?b makes ?c clear
      (not (on ?b ?c))
      (not (hand-empty))
      ;; ?b remains clear while held
    )
  )

  ;; Put a held block down onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (on-table ?b)
      (clear ?b)
      (hand-empty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block onto a clear block
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (hand-empty)
      (not (holding ?b))
    )
  )
)
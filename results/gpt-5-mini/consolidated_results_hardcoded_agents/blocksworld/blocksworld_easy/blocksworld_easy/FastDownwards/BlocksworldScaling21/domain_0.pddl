(define (domain blocks-single-handed)
  (:requirements :strips :typing :negative-preconditions)
  (:types block surface)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (handempty)
    (clear ?x - block)
  )

  ;; Pick up a clear block from the table while the hand is empty.
  (:action pick-up
    :parameters (?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Unstack a clear block ?b from block ?c while the hand is empty.
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Put down a held block on the table.
  (:action put-down
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack a held block ?b onto a clear block ?c.
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))
      (not (holding ?b))
    )
  )
)
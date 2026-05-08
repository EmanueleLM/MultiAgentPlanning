(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (holding ?b - block)
    (handempty)
  )

  ;; PickUp: pick a clear block from the table when the hand is empty.
  (:action PickUp
    :parameters (?b - block)
    :precondition (and
      (clear ?b)
      (ontable ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; Unstack: pick a clear block directly on top of another block when the hand is empty.
  ;; The supporting block becomes clear after the unstack.
  (:action Unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
    )
  )

  ;; PutDown: put a held block onto the table. Hand becomes empty after the action.
  (:action PutDown
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

  ;; Stack: stack a held block ?b onto a clear block ?c. Hand becomes empty after the action.
  (:action Stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (ontable ?b))
    )
  )
)
(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b ?s - block)        ; ?b is on ?s
    (ontable ?b - block)      ; ?b is on the table
    (clear ?b - block)        ; nothing on top of ?b and it is not being held
    (holding ?b - block)      ; agent is holding ?b
    (handempty)               ; agent's hand is empty (no holding)
  )

  ; pick-up: take a clear block from the table into the hand
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

  ; unstack: remove a clear block ?b from on top of ?s into the hand
  (:action unstack
    :parameters (?b - block ?s - block)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (= ?b ?s))
    )
    :effect (and
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ; put-down: place the held block on the table
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

  ; stack: place the held block ?b onto clear block ?s
  (:action stack
    :parameters (?b - block ?s - block)
    :precondition (and
      (holding ?b)
      (clear ?s)
      (not (= ?b ?s))
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?s))
    )
  )
)
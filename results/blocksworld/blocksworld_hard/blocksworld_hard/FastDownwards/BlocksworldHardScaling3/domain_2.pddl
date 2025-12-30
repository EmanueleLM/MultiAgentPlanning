(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and 
      (hand-empty)
      (on-table ?b)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (hand-empty))
      (not (on-table ?b))
      (not (clear ?b))
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (hand-empty)
      (on ?b ?c)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (hand-empty))
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
    )
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (hand-empty)
      (on-table ?b)
      (clear ?b)
      (not (holding ?b))
    )
  )

  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (hand-empty)
      (on ?b ?c)
      (not (clear ?c))
      (not (holding ?b))
      (clear ?b)
    )
  )
)
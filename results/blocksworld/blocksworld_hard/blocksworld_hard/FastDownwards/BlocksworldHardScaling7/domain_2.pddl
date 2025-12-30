(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block - object
  )
  (:predicates
    (on ?b1 - block ?b2 - block)
    (on-table ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (hand-empty)
  )

  ; Pick up a clear block from the table
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
        (not (clear ?b)) ; Block is picked up, hence no longer clear by definition
    )
  )

  ; Put down a held block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
        (hand-empty)
        (not (holding ?b))
        (on-table ?b)
        (clear ?b) ; Block is stationary and nothing is on it, hence clear
    )
  )

  ; Unstack a clear block b1 from b2
  (:action unstack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and
        (hand-empty)
        (on ?b1 ?b2)
        (clear ?b1)
    )
    :effect (and
        (holding ?b1)
        (not (hand-empty))
        (not (on ?b1 ?b2))
        (clear ?b2) ; b2 becomes clear
        (not (clear ?b1)) ; b1 is picked up, hence no longer clear
    )
  )

  ; Stack a held block b1 onto a clear block b2
  (:action stack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and
        (holding ?b1)
        (clear ?b2)
    )
    :effect (and
        (hand-empty)
        (not (holding ?b1))
        (on ?b1 ?b2)
        (not (clear ?b2)) ; b2 is no longer clear
        (clear ?b1) ; b1 is no longer held, hence clear
    )
  )
)
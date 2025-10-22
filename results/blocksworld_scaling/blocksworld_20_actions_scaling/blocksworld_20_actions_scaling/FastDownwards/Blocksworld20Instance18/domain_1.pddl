(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block hand)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handfree ?h - hand)
    (holding ?h - hand ?x - block)
  )

  ;; pick up a block from the table with a free hand
  (:action pickup
    :parameters (?h - hand ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handfree ?h))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handfree ?h))
      (holding ?h ?x)
    )
  )

  ;; put down a held block on the table
  (:action putdown
    :parameters (?h - hand ?x - block)
    :precondition (holding ?h ?x)
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handfree ?h)
      (not (holding ?h ?x))
    )
  )

  ;; unstack a top block from another block using a free hand
  (:action unstack
    :parameters (?h - hand ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handfree ?h))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handfree ?h))
      (holding ?h ?x)
    )
  )

  ;; stack a held block onto another clear block
  (:action stack
    :parameters (?h - hand ?x - block ?y - block)
    :precondition (and (holding ?h ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handfree ?h)
      (not (holding ?h ?x))
    )
  )
)
(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    block - object
  )
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )
  (:functions
    (total-cost)
  )

  ; Action: Pickup block B from the table
  (:action pickup
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
      (increase (total-cost) 1)
    )
  )

  ; Action: Put down block B onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (increase (total-cost) 1)
    )
  )

  ; Action: Unstack block B from block C
  (:action unstack
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
      (clear ?c)
      (holding ?b)
      (increase (total-cost) 1)
    )
  )

  ; Action: Stack block B onto block C
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (clear ?b)
      (on ?b ?c)
      (handempty)
      (increase (total-cost) 1)
    )
  )
)
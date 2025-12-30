(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions :action-costs) 
  (:types 
    block - object
  )
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
  )
  (:functions
    (total-cost)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and (on-table ?b) (clear ?b) (hand-empty))
    :effect (and (holding ?b)
                 (not (on-table ?b))
                 (not (clear ?b))
                 (not (hand-empty))
                 (increase (total-cost) 1)
            )
  )

  (:action unstack
    :parameters (?b - block ?a - block)
    :precondition (and (on ?b ?a) (clear ?b) (hand-empty))
    :effect (and (holding ?b)
                 (clear ?a)
                 (not (on ?b ?a))
                 (not (clear ?b))
                 (not (hand-empty))
                 (increase (total-cost) 1)
            )
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (on-table ?b)
                 (clear ?b)
                 (hand-empty)
                 (not (holding ?b))
                 (increase (total-cost) 1)
            )
  )

  (:action stack
    :parameters (?b - block ?a - block)
    :precondition (and (holding ?b) (clear ?a))
    :effect (and (on ?b ?a)
                 (clear ?b) 
                 (hand-empty)
                 (not (holding ?b))
                 (not (clear ?a))
                 (increase (total-cost) 1)
            )
  )
)
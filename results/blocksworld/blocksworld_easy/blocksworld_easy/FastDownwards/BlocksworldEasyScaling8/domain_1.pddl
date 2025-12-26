(define (domain blocksworld-easy-scaling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    block
  )
  
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (hand-empty)
    (holding ?x - block)
  )

  (:functions 
    (total-cost) - number
  )

  ;; Action 1: Pick up a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and 
      (clear ?x) 
      (ontable ?x) 
      (hand-empty)
    )
    :effect (and 
      (not (ontable ?x))
      (not (clear ?x))
      (not (hand-empty))
      (holding ?x)
      (increase (total-cost) 1)
    )
  )

  ;; Action 2: Put down a block onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and 
      (ontable ?x)
      (clear ?x)
      (hand-empty)
      (not (holding ?x))
      (increase (total-cost) 1)
    )
  )

  ;; Action 3: Unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and 
      (on ?x ?y) 
      (clear ?x) 
      (hand-empty)
    )
    :effect (and 
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (hand-empty))
      (holding ?x)
      (increase (total-cost) 1)
    )
  )

  ;; Action 4: Stack a block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and 
      (holding ?x) 
      (clear ?y)
    )
    :effect (and 
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (hand-empty)
      (not (holding ?x))
      (increase (total-cost) 1)
    )
  )
)
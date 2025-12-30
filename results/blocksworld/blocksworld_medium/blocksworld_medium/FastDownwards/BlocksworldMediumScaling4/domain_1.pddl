(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types 
    block
  )
  
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )

  (:functions
    (total-cost) - number
  )

  ;; Pick up block X from the Table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty)) (holding ?x)
                 (increase (total-cost) 1))
  )

  ;; Put down block X onto the Table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (not (holding ?x)) (handempty) (clear ?x) (ontable ?x)
                 (increase (total-cost) 1))
  )

  ;; Unstack block X from block Y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (not (on ?x ?y)) (not (clear ?x)) (not (handempty)) (holding ?x) (clear ?y)
                 (increase (total-cost) 1))
  )

  ;; Stack block X onto block Y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (handempty) (on ?x ?y)
                 (increase (total-cost) 1))
  )
)
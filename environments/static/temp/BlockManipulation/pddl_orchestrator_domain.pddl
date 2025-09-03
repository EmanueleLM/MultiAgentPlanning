(define (domain block-manipulation)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (block ?x - block)
  )
  
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )
  
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)))
  )
  
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)))
  )
  
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )

  (:action move
    :parameters (?x - block ?y - block ?z - block)
    :precondition (and (block ?x) (block ?y) (block ?z) (clear ?x) (clear ?z) (on ?x ?y))
    :effect (and (on ?x ?z) (clear ?y) (not (on ?x ?y)) (not (clear ?z)))
  )

  (:action move-to-table
    :parameters (?x - block ?y - block)
    :precondition (and (block ?x) (block ?y) (clear ?x) (on ?x ?y))
    :effect (and (ontable ?x) (clear ?y) (not (on ?x ?y)))
  )
)
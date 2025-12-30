(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  
  (:predicates
    (ontable ?x - block)
    (on ?x - block ?y - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )
  
  ;; Pick up a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and 
      (ontable ?x) 
      (clear ?x) 
      (handempty)
    )
    :effect (and 
      (not (ontable ?x)) 
      (not (clear ?x)) 
      (not (handempty)) 
      (holding ?x)
    )
  )
  
  ;; Put down a block onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and 
      (ontable ?x) 
      (clear ?x) 
      (handempty) 
      (not (holding ?x))
    )
  )
  
  ;; Stack block ?x onto block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and 
      (holding ?x) 
      (clear ?y)
    )
    :effect (and 
      (on ?x ?y) 
      (clear ?x)
      (handempty) 
      (not (holding ?x)) 
      (not (clear ?y))
    )
  )
  
  ;; Unstack block ?x from block ?y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and 
      (on ?x ?y) 
      (clear ?x) 
      (handempty)
    )
    :effect (and 
      (not (on ?x ?y)) 
      (not (clear ?x)) 
      (not (handempty)) 
      (holding ?x) 
      (clear ?y)
    )
  )
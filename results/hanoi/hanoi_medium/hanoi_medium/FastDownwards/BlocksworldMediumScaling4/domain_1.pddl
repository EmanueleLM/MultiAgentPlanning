(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    block table_object - object
  )
  (:predicates
    (on ?x - block ?y - (either block table_object))
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
  )
  (:functions
    (total-cost) - number
  )

  (:action pickup
    :parameters (?x - block)
    :precondition (and (clear ?x) (on ?x table) (handempty))
    :effect (and (not (clear ?x)) (not (on ?x table)) (not (handempty))
                 (holding ?x)
                 (increase (total-cost) 1)
            )
  )

  (:action putdown
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (clear ?x) (on ?x table) (handempty)
                 (not (holding ?x))
                 (increase (total-cost) 1)
            )
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty)
                 (not (holding ?x)) (not (clear ?y))
                 (increase (total-cost) 1)
            )
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (not (on ?x ?y)) (not (clear ?x)) (not (handempty))
                 (holding ?x) (clear ?y)
                 (increase (total-cost) 1)
            )
  )
)
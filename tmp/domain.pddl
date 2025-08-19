(define (domain blocksworld-coordinated)
  (:requirements :strips :typing)
  (:types block)
  
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and (clear ?b) (on-table ?b) (handempty))
    :effect (and (holding ?b) (not (clear ?b)) (not (on-table ?b)) (not (handempty)))
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (clear ?b) (on-table ?b) (not (holding ?b)) (handempty))
  )

  (:action stack
    :parameters (?b - block ?b2 - block)
    :precondition (and (holding ?b) (clear ?b2))
    :effect (and (not (holding ?b)) (not (clear ?b2)) (on ?b ?b2) (clear ?b) (handempty))
  )

  (:action unstack
    :parameters (?b - block ?b2 - block)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty))
    :effect (and (holding ?b) (clear ?b2) (not (on ?b ?b2)) (not (clear ?b)) (not (handempty)))
  )
)
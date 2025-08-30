(define (domain blocks-world)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)
    (clear ?x)
    (holding ?x)
    (table ?x)
  )
  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (table ?x))
    :effect (and (not (clear ?x)) (not (table ?x)) (holding ?x))
  )
  (:action put-down
    :parameters (?x)
    :precondition (and (holding ?x))
    :effect (and (clear ?x) (table ?x) (not (holding ?x)))
  )
  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (on ?x ?y) (clear ?x))
  )
  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)))
  )
)
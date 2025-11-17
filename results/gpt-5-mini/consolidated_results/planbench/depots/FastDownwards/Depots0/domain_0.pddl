(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (free ?o - obj)
    (next ?a - obj ?b - obj)
  )

  ;; Each available action creates a next relation between two objects.
  ;; Actions require both objects to be free and then produce (next ?x ?y).
  ;; They also remove the free status of the source object to model resource use.
  (:action paltry
    :parameters (?x - obj ?y - obj)
    :precondition (and (free ?x) (free ?y))
    :effect (and (next ?x ?y) (not (free ?x)))
  )

  (:action sip
    :parameters (?x - obj ?y - obj)
    :precondition (and (free ?x) (free ?y))
    :effect (and (next ?x ?y) (not (free ?x)))
  )

  (:action clip
    :parameters (?x - obj ?y - obj)
    :precondition (and (free ?x) (free ?y))
    :effect (and (next ?x ?y) (not (free ?x)))
  )

  (:action wretched
    :parameters (?x - obj ?y - obj)
    :precondition (and (free ?x) (free ?y))
    :effect (and (next ?x ?y) (not (free ?x)))
  )

  (:action memory
    :parameters (?x - obj ?y - obj)
    :precondition (and (free ?x) (free ?y))
    :effect (and (next ?x ?y) (not (free ?x)))
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj)
    :precondition (and (free ?x) (free ?y))
    :effect (and (next ?x ?y) (not (free ?x)))
  )
)
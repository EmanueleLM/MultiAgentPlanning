(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent thing)
  (:predicates 
    (next ?a - thing ?b - thing)
    (placed-by-one ?a - thing ?b - thing)
    (placed-by-two ?a - thing ?b - thing)
  )

  ;; Action performed by planner_one to establish a next relation
  (:action place-next-by-one
    :parameters (?x - thing ?y - thing)
    :precondition (not (next ?x ?y))
    :effect (and
      (next ?x ?y)
      (placed-by-one ?x ?y)
    )
  )

  ;; Action performed by planner_two to establish a next relation
  (:action place-next-by-two
    :parameters (?x - thing ?y - thing)
    :precondition (not (next ?x ?y))
    :effect (and
      (next ?x ?y)
      (placed-by-two ?x ?y)
    )
  )
)
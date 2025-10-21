(define (domain next-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (next ?a - obj ?b - obj)
  )

  ;; Action to establish a next relation between two objects when it does not already exist.
  (:action set-next
    :parameters (?x - obj ?y - obj)
    :precondition (and (not (next ?x ?y)))
    :effect (and (next ?x ?y))
  )

  ;; Action to remove an existing next relation between two objects.
  (:action unset-next
    :parameters (?x - obj ?y - obj)
    :precondition (and (next ?x ?y))
    :effect (and (not (next ?x ?y)))
  )
)
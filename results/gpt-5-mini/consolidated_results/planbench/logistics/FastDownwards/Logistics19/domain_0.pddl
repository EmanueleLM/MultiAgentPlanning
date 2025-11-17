(define (domain linking)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (next ?a - object ?b - object)
    (different ?a - object ?b - object)
  )

  (:action make-next
    :parameters (?a - object ?b - object)
    :precondition (and (different ?a ?b) (not (next ?a ?b)))
    :effect (and (next ?a ?b))
  )

  (:action remove-next
    :parameters (?a - object ?b - object)
    :precondition (next ?a ?b)
    :effect (and (not (next ?a ?b)))
  )
)
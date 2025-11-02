(define (domain multi_next)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (next ?a - object ?b - object)
  )

  ;; Public action schema: establish a "next" relation between two objects.
  ;; This action is always available and idempotent (re-asserting an existing next is harmless).
  (:action set-next
    :parameters (?a - object ?b - object)
    :precondition ()
    :effect (next ?a ?b)
  )
)
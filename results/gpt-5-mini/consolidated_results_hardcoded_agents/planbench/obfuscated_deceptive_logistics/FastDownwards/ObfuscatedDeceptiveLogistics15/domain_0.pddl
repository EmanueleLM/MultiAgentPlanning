(define (domain sequence-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types node)
  (:predicates
    (next ?a - node ?b - node)
  )

  ;; Action to establish a next relation between two nodes.
  ;; Once established, a (next ...) fact is never removed.
  (:action set-next
    :parameters (?x - node ?y - node)
    :precondition (not (next ?x ?y))
    :effect (next ?x ?y)
  )
)
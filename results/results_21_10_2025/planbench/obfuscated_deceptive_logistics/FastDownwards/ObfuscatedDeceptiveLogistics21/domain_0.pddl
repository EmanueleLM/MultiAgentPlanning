(define (domain linking)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (next ?from - object ?to - object)
  )

  ;; Create a "next" link between two objects if it does not already exist.
  ;; Multiple successors or predecessors are allowed (no global uniqueness constraint),
  ;; so the planner can achieve multiple next facts for the same object where required.
  (:action set-next
    :parameters (?a - object ?b - object)
    :precondition (not (next ?a ?b))
    :effect (and (next ?a ?b))
  )
)
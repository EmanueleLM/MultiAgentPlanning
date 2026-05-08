(define (domain reorder-list)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    ;; next A B means A is immediately before B in the linear sequence
    (next ?a - obj ?b - obj)
  )

  ;; swap-adjacent splices two adjacent nodes A and B (with predecessor P and successor S)
  ;; Preconditions require the pattern P -> A -> B -> S to exist. Effects replace that
  ;; with P -> B -> A -> S, preserving a single linear chain and preventing cycles.
  (:action swap-adjacent
    :parameters (?p - obj ?a - obj ?b - obj ?s - obj)
    :precondition (and
      (next ?p ?a)
      (next ?a ?b)
      (next ?b ?s)
    )
    :effect (and
      (not (next ?p ?a))
      (not (next ?a ?b))
      (not (next ?b ?s))
      (next ?p ?b)
      (next ?b ?a)
      (next ?a ?s)
    )
  )
)
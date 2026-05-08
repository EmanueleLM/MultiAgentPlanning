(define (domain sequence-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ;; adjacency relation: next A B means A is immediately followed by B in the required adjacency relation
    (next ?a - obj ?b - obj)
  )

  ;; Action available to establish an adjacency relation between two objects.
  ;; Preconditions:
  ;;   - the adjacency (next ?a ?b) does not already hold
  ;;   - the two objects are not the same (no self-loop)
  ;; Effects:
  ;;   - assert the adjacency (next ?a ?b)
  (:action establish-next
    :parameters (?a - obj ?b - obj)
    :precondition (and (not (next ?a ?b)) (not (= ?a ?b)))
    :effect (and (next ?a ?b))
  )
)
(define (domain sequence-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    ;; directed adjacency relation between objects
    (next ?from - object ?to - object)
  )

  ;; Create a directed link from one object to another.
  ;; Preconditions:
  ;; - The specific next relation must not already hold (prevents duplicate link actions).
  ;; Effects:
  ;; - Adds the next relation between the two objects.
  (:action link
    :parameters (?from - object ?to - object)
    :precondition (not (next ?from ?to))
    :effect (next ?from ?to)
  )
)
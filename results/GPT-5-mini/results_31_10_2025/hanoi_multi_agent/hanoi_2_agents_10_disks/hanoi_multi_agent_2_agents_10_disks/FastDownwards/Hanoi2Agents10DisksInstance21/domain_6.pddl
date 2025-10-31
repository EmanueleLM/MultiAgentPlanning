(define (domain hanoi-2agents-10)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?d ?p)
    (clear ?x)
    (can-place ?d ?p)
    (allowed ?a ?d)
  )

  (:action move
    :parameters (?a ?d ?from ?to)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)
(define (domain hanoi)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)
    (clear ?x)
    (smaller ?x ?y)
  )

  (:action move-to-empty
    :parameters (?d ?from ?to)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-onto
    :parameters (?d ?from ?top)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?top) (smaller ?d ?top))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (clear ?from)
      (not (clear ?top))
    )
  )
)
(define (domain trip-domain)
  (:requirements :strips)
  (:predicates
    (current-day ?d)
    (next ?d1 ?d2)
    (at ?city ?d)
    (flight ?from ?to)
  )

  (:action stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (current-day ?d1) (at ?city ?d1) (next ?d1 ?d2))
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (at ?city ?d2)
    )
  )

  (:action fly
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (current-day ?d1) (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (at ?to ?d2)
    )
  )
)
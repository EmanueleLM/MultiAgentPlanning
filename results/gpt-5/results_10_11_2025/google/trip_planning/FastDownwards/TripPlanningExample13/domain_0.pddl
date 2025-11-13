(define (domain travel-17days)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current-day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current-day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (flight ?from ?to)
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (at ?to ?d2)
    )
  )
)
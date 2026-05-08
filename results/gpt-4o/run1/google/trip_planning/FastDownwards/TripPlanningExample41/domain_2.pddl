(define (domain travel)

  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (in_city ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (conference ?c - city ?d - day)
    (successor ?d1 - day ?d2 - day)
    (visited ?c - city ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (direct_flight ?from ?to)
      (in_city ?from ?d1)
      (successor ?d1 ?d2)
    )
    :effect (and
      (not (in_city ?from ?d2))
      (in_city ?to ?d2)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (in_city ?c ?d1)
      (successor ?d1 ?d2)
    )
    :effect (and
      (in_city ?c ?d2)
      (visited ?c ?d2)
    )
  )
)
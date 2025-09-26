(define (domain trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (conn ?c1 - city ?c2 - city)
    (free ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2) (free ?d2))
    :effect (and
      (not (free ?d2))
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (free ?d2) (conn ?from ?to))
    :effect (and
      (not (free ?d2))
      (at ?to ?d2)
    )
  )
)
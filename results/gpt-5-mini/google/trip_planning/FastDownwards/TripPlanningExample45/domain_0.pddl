(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d_next)
      (not (assigned ?d_next))
    )
    :effect (and
      (at ?c ?d_next)
      (assigned ?d_next)
    )
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c_from ?d)
      (next ?d ?d_next)
      (flight ?c_from ?c_to)
      (not (assigned ?d_next))
    )
    :effect (and
      (at ?c_to ?d_next)
      (assigned ?d_next)
    )
  )
)
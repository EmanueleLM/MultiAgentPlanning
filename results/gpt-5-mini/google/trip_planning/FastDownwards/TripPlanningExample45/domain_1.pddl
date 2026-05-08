(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; person is in city ?c on day ?d
    (assigned ?d - day)           ; day ?d has been assigned a city
    (next ?d1 - day ?d2 - day)    ; chronological successor relation
    (flight ?from - city ?to - city) ; direct flight availability
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
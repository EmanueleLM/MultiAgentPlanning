(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (flight ?from - city ?to - city)
    (next_day ?d ?dnext - day)
    (traveler_exists ?p - person)
  )

  (:action start_in
    :parameters (?p - person ?city - city ?d - day)
    :precondition (and
      (traveler_exists ?p)
      (not (assigned ?d))
    )
    :effect (and
      (at ?city ?d)
      (assigned ?d)
    )
  )

  (:action stay
    :parameters (?p - person ?city - city ?d - day ?dnext - day)
    :precondition (and
      (traveler_exists ?p)
      (at ?city ?d)
      (next_day ?d ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?city ?dnext)
      (assigned ?dnext)
    )
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (traveler_exists ?p)
      (at ?from ?d)
      (flight ?from ?to)
      (next_day ?d ?dnext)
      (not (assigned ?dnext))
    )
    :effect (and
      (at ?to ?dnext)
      (assigned ?dnext)
    )
  )
)
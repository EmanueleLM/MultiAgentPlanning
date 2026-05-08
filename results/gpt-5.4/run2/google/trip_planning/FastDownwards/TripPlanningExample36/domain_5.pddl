(define (domain tripplanningexample36)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (current_day ?d - day)
    (spent ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d - day ?dn - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (current_day ?dn)
      (not (current_day ?d))
    )
  )

  (:action fly
    :parameters (?d - day ?dn - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at ?from)
      (direct ?from ?to)
      (not (spent ?d ?to))
    )
    :effect (and
      (spent ?d ?to)
      (at ?to)
      (current_day ?dn)
      (not (at ?from))
      (not (current_day ?d))
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
    )
  )

  (:action fly_last_day
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from ?to)
      (not (spent ?d ?to))
    )
    :effect (and
      (spent ?d ?to)
      (at ?to)
      (not (at ?from))
      (not (current_day ?d))
    )
  )
)
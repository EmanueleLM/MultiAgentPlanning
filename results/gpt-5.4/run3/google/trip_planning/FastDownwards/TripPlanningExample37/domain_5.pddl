(define (domain tripplanningexample37)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (started)
  )

  (:action start_in
    :parameters (?c - city)
    :precondition (and
      (not (started))
      (current_day day_1))
    :effect (and
      (started)
      (at ?c day_1))
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at ?c ?d)
      (not (at ?c ?nd)))
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at ?c ?nd))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at ?from ?d)
      (direct ?from ?to)
      (not (at ?to ?nd)))
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at ?to ?nd))
  )
)
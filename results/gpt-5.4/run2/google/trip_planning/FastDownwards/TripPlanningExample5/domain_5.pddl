(define (domain tripplanningexample5_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at oslo day1))
      (not (at porto day1))
      (not (at dubrovnik day1))
    )
    :effect (and
      (at ?c day1)
      (visited ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?c ?d)
      (not (at oslo ?nd))
      (not (at porto ?nd))
      (not (at dubrovnik ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at ?c ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from ?d)
      (direct ?from ?to)
      (not (at oslo ?nd))
      (not (at porto ?nd))
      (not (at dubrovnik ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at ?to ?nd)
      (visited ?to)
    )
  )
)
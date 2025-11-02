(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (workshop-day ?d - day)
    (is-riga ?c - city)
  )

  (:action stay-regular
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current-day ?d)
      (next ?d ?d2)
      (at ?c)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  (:action stay-workshop
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current-day ?d)
      (next ?d ?d2)
      (workshop-day ?d)
      (at ?c)
      (is-riga ?c)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  (:action fly-regular
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current-day ?d)
      (next ?d ?d2)
      (not (workshop-day ?d))
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to)
    )
  )
)
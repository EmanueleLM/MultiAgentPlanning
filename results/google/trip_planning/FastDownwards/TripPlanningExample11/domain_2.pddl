(define (domain tripplanningexample11)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (connected ?a - city ?b - city)
    (next ?d - day ?nd - day)
    (last-day ?d - day)
    (current-day ?d - day)
    (at ?c - city)
    (present ?d - day ?c - city)
    (visited ?c - city)
    (done)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and (current-day ?d) (at ?c) (next ?d ?nd) (not (done)))
    :effect (and
      (present ?d ?c)
      (visited ?c)
      (not (current-day ?d))
      (current-day ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (current-day ?d)
      (at ?from)
      (connected ?from ?to)
      (next ?d ?nd)
      (not (done))
    )
    :effect (and
      (present ?d ?from)
      (visited ?from)
      (not (current-day ?d))
      (current-day ?nd)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action end
    :parameters (?c - city ?d - day)
    :precondition (and
      (current-day ?d)
      (at ?c)
      (last-day ?d)
      (not (done))
    )
    :effect (and
      (present ?d ?c)
      (visited ?c)
      (done)
    )
  )
)
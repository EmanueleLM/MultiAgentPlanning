(define (domain travel-11days)
  (:requirements :strips :typing)
  (:types
    day
    city
  )
  (:predicates
    (next ?d1 - day ?d2 - day)
    (free ?d - day)
    (current ?d - day)
    (in ?c - city)
    (at ?d - day ?c - city)
    (direct ?from - city ?to - city)
    (first ?d - day)
    (start)
  )

  (:action set-first
    :parameters (?d - day ?c - city)
    :precondition (and
      start
      (first ?d)
      (free ?d)
    )
    :effect (and
      (at ?d ?c)
      (in ?c)
      (current ?d)
      (not (free ?d))
      (not start)
    )
  )

  (:action stay-next
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (in ?c)
      (free ?d2)
    )
    :effect (and
      (at ?d2 ?c)
      (current ?d2)
      (not (current ?d))
      (not (free ?d2))
    )
  )

  (:action fly-next
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (in ?from)
      (direct ?from ?to)
      (free ?d2)
    )
    :effect (and
      (at ?d2 ?to)
      (in ?to)
      (not (in ?from))
      (current ?d2)
      (not (current ?d))
      (not (free ?d2))
    )
  )
)
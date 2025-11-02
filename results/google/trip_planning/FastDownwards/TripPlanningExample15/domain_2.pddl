(define (domain trip-11days-direct)
  (:requirements :strips :typing)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (free ?d - day)
    (current ?d - day)
    (in ?c - city)
    (at ?d - day ?c - city)
    (direct ?from - city ?to - city)
    (first ?d - day)
    (start)
    (allowed ?d - day ?c - city)
  )

  (:action set-first
    :parameters (?d - day ?c - city)
    :precondition (and
      (start)
      (first ?d)
      (free ?d)
      (allowed ?d ?c)
    )
    :effect (and
      (at ?d ?c)
      (in ?c)
      (current ?d)
      (not (free ?d))
      (not (start))
    )
  )

  (:action stay-next
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (in ?c)
      (free ?d2)
      (allowed ?d2 ?c)
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
      (allowed ?d2 ?to)
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
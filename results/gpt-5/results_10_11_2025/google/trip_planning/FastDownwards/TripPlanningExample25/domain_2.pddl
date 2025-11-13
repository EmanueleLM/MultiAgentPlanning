(define (domain tripplanningexample25)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d - day ?d2 - day)
    (today ?d - day)
    (last ?d - day)
    (flight ?from - city ?to - city)
    (current ?c - city)
    (at-day ?d - day ?c - city)
    (assigned ?d - day)
    (started)
  )

  (:action choose-start
    :parameters (?c - city)
    :precondition (and
      (not (started))
    )
    :effect (and
      (started)
      (current ?c)
    )
  )

  (:action stay-same
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (current ?c)
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?c)
      (assigned ?d)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action move
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (current ?from)
      (flight ?from ?to)
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?from)
      (assigned ?d)
      (not (today ?d))
      (today ?d2)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action finalize
    :parameters (?d - day ?c - city)
    :precondition (and
      (today ?d)
      (last ?d)
      (current ?c)
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?c)
      (assigned ?d)
      (not (today ?d))
    )
  )
)
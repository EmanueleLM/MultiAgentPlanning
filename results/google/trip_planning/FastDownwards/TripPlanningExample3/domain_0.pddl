(define (domain trip-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (connected ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (cursor ?d - day)
    (pos ?c - city)
    (assigned ?d - day)
    (in ?c - city ?d - day)
    (start ?d - day)
  )

  (:action start-in
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (start ?d)
      (cursor ?d)
      (next ?d ?d2)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (in ?c ?d)
      (pos ?c)
      (not (cursor ?d))
      (cursor ?d2)
    )
  )

  (:action assign-stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (cursor ?d)
      (next ?d ?d2)
      (pos ?c)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (in ?c ?d)
      (not (cursor ?d))
      (cursor ?d2)
    )
  )

  (:action assign-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (cursor ?d)
      (next ?d ?d2)
      (pos ?from)
      (connected ?from ?to)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (in ?to ?d)
      (not (pos ?from))
      (pos ?to)
      (not (cursor ?d))
      (cursor ?d2)
    )
  )
)
(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (assigned ?d - day)
    (workshop-done)
    (is-venice ?c - city)
    (eligible-workshop-day ?d - day)
  )

  (:action assign-initial
    :parameters (?c - city ?d - day)
    :precondition (not (assigned ?d))
    :effect (and
      (at ?c ?d)
      (assigned ?d)
    )
  )

  (:action move-day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?d2)
    )
  )

  (:action hold-workshop
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?c ?d)
      (is-venice ?c)
      (eligible-workshop-day ?d)
    )
    :effect (workshop-done)
  )
)
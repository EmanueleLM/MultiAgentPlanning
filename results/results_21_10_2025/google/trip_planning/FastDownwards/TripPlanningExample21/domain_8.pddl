(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (assigned ?d - day)
    (workshop-done)
    (eligible-workshop-day ?d - day)
    (start-day ?d - day)
    (is-venice ?c - city)
  )

  (:action start-trip
    :parameters (?d - day ?c - city)
    :precondition (and (start-day ?d) (not (assigned ?d)))
    :effect (and
      (at ?d ?c)
      (assigned ?d)
    )
  )

  (:action stay-day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (at ?d1 ?c)
      (next ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  (:action travel
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (at ?d1 ?from)
      (next ?d1 ?d2)
      (connected ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )

  (:action hold-workshop
    :parameters (?d - day ?c - city)
    :precondition (and
      (at ?d ?c)
      (is-venice ?c)
      (eligible-workshop-day ?d)
      (not (workshop-done))
    )
    :effect (and
      (workshop-done)
    )
  )
)
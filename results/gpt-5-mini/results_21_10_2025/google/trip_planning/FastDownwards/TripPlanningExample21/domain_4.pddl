(define (domain trip-planning)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (assigned ?d - day)
    (workshop-done)
    (is-venice ?c - city)
    (eligible-workshop-day ?d - day)
    (start-day ?d - day)
  )

  (:action start-trip
    :parameters (?c - city ?d - day)
    :precondition (and (start-day ?d) (not (assigned ?d)))
    :effect (and
      (at ?c ?d)
      (assigned ?d)
    )
  )

  (:action stay-day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
    )
  )

  (:action travel
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
(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (flight ?c1 - city ?c2 - city)
    (at-day ?d - day ?c - city)
    (assigned ?d - day)
  )

  (:action choose-start
    :parameters (?d - day ?c - city)
    :precondition (and
                    (today ?d)
                    (not (assigned ?d))
                  )
    :effect (and
              (at-day ?d ?c)
              (assigned ?d)
            )
  )

  (:action stay-same
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
                    (next ?d ?d2)
                    (at-day ?d ?c)
                    (not (assigned ?d2))
                  )
    :effect (and
              (at-day ?d2 ?c)
              (assigned ?d2)
            )
  )

  (:action move
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
                    (next ?d ?d2)
                    (at-day ?d ?from)
                    (flight ?from ?to)
                    (not (assigned ?d2))
                  )
    :effect (and
              (at-day ?d2 ?to)
              (assigned ?d2)
            )
  )
)
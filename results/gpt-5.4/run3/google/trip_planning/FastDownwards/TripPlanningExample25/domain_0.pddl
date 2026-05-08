(define (domain european_trip_16days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (cursor ?d - day)
  )

  (:action assign_start
    :parameters (?c - city)
    :precondition (and
      (not (assigned d1))
    )
    :effect (and
      (at d1 ?c)
      (assigned d1)
      (cursor d1)
    )
  )

  (:action stay_next
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (cursor ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (not (cursor ?d1))
      (cursor ?d2)
    )
  )

  (:action fly_next
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (cursor ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (not (cursor ?d1))
      (cursor ?d2)
    )
  )
)
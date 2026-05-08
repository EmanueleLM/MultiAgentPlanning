(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (located_on ?c - city ?d - day)
    (required_city ?d - day ?c - city)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (current day1)
      (not (at reykjavik))
      (not (at riga))
      (not (at paris))
      (located_on ?c day1)
    )
    :effect (and
      (at ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (located_on ?c ?d2))
    )
    :effect (and
      (located_on ?c ?d2)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (located_on ?to ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (located_on ?to ?d2)
      (not (current ?d1))
      (current ?d2)
    )
  )
)
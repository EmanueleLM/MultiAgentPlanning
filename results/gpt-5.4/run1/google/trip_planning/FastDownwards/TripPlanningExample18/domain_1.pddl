(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current ?d - day)
    (visited ?c - city)
    (met_friends)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (at amsterdam d1))
      (not (at vilnius d1))
      (not (at bucharest d1))
    )
    :effect (and
      (at ?c d1)
      (visited ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at amsterdam ?d2))
      (not (at vilnius ?d2))
      (not (at bucharest ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at amsterdam ?d2))
      (not (at vilnius ?d2))
      (not (at bucharest ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (at ?to ?d2)
      (visited ?to)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (at bucharest ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)
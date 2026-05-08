(define (domain european_trip_13_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (last_day ?d - day)
    (visited ?c - city ?d - day)
    (meeting_day ?d - day)
    (met_friend)
  )

  (:action start_in
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (at barcelona))
      (not (at krakow))
      (not (at rome))
    )
    :effect (and
      (at ?c)
      (visited ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited barcelona ?d2))
      (not (visited krakow ?d2))
      (not (visited rome ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited barcelona ?d2))
      (not (visited krakow ?d2))
      (not (visited rome ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at krakow)
      (current ?d)
      (meeting_day ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)
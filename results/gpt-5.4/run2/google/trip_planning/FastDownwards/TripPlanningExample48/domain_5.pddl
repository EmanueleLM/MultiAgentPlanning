(define (domain european_trip_4_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (used ?d - day)
    (meet_window ?d - day)
    (met_friend)
  )

  (:action start_in_city
    :parameters (?c - city ?d - day)
    :precondition (and
      (not (used ?d))
    )
    :effect (and
      (at ?c ?d)
      (used ?d)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (used ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (used ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (used ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (at ?to ?d2)
      (used ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at split ?d)
      (meet_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)
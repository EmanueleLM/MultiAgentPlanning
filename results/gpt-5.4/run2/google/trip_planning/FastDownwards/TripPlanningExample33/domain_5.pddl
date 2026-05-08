(define (domain tripplanningexample33_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (at ?c - city)
    (current_day ?d - day)

    (occupied ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (at barcelona))
      (not (at krakow))
      (not (at rome))
      (not (occupied barcelona d1))
      (not (occupied krakow d1))
      (not (occupied rome d1))
    )
    :effect (and
      (at ?c)
      (occupied ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (occupied barcelona ?d2))
      (not (occupied krakow ?d2))
      (not (occupied rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied barcelona ?d2))
      (not (occupied krakow ?d2))
      (not (occupied rome ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)
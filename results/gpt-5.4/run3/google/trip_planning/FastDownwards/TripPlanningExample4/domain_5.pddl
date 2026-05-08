(define (domain european_trip_12_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (occupied ?c - city ?d - day)
    (friend_window ?d - day)
    (friend_met)
    (started)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (started))
    )
    :effect (and
      (started)
      (at ?c)
      (occupied ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (occupied ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current ?d1)
      (next ?d1 ?d2)
      (flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (occupied ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at tallinn)
      (current ?d)
      (friend_window ?d)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)
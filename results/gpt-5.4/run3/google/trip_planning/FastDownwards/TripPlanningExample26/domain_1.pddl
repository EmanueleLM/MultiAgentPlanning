(define (domain trip_planning_example26)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (today d0)
      (not (visited ?c))
    )
    :effect (and
      (at ?c d1)
      (visited ?c)
      (not (today d0))
      (today d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
    )
    :effect (and
      (at ?c ?d2)
      (not (today ?d1))
      (today ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (?from = ?to))
      (not (visited ?to))
    )
    :effect (and
      (at ?to ?d2)
      (visited ?to)
      (not (today ?d1))
      (today ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (today ?d)
      (at reykjavik ?d)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)
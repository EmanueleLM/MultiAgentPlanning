(define (domain trip_planning_example12)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (occupied ?d - day)
    (in_window ?d - day)
    (friend_met)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (not (occupied day_1))
    )
    :effect (and
      (at ?c day_1)
      (occupied day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (at tallinn ?d)
      (in_window ?d)
      (not (friend_met))
    )
    :effect (and
      (friend_met)
    )
  )
)
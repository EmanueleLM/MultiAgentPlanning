(define (domain tripplanningexample26)
  (:requirements :strips :typing)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (on_day ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
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
      (on_day ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (on_day ?to ?d2)
    )
  )

  (:action stay_and_meet
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at reykjavik)
      (current ?d1)
      (next ?d1 ?d2)
      (friend_window ?d2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (on_day reykjavik ?d2)
      (met_friend)
    )
  )

  (:action fly_and_meet
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from reykjavik)
      (current ?d1)
      (next ?d1 ?d2)
      (friend_window ?d2)
    )
    :effect (and
      (not (at ?from))
      (at reykjavik)
      (not (current ?d1))
      (current ?d2)
      (on_day reykjavik ?d2)
      (met_friend)
    )
  )
)
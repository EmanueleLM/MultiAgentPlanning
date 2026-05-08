(define (domain tripplanningexample26)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)

    (visited_on ?c - city ?d - day)

    (friend_window ?d - day)
    (met_friend)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on ?to ?d2)
    )
  )

  (:action stay_and_meet
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at reykjavik)
      (current_day ?d)
      (next ?d ?d2)
      (friend_window ?d2)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on reykjavik ?d2)
      (met_friend)
    )
  )

  (:action fly_and_meet
    :parameters (?from - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at reykjavik))
      (direct ?from reykjavik)
      (current_day ?d)
      (next ?d ?d2)
      (friend_window ?d2)
      (not (met_friend))
    )
    :effect (and
      (not (at ?from))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?d2)
      (visited_on reykjavik ?d2)
      (met_friend)
    )
  )
)
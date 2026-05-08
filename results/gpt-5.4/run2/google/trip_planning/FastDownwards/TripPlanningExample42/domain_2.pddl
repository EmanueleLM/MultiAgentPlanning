(define (domain tripplanningexample42)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    paris nice mykonos - city
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city ?c - city)
    (visited ?d - day)
    (at_on ?d - day ?c - city)
    (friends_window ?d - day)
    (met_friends)
  )

  (:action stay
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (in_city ?c)
      (not (visited ?d))
    )
    :effect (and
      (visited ?d)
      (at_on ?d ?c)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action stay_meet_friends
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (in_city paris)
      (not (visited ?d))
      (friends_window ?d)
    )
    :effect (and
      (visited ?d)
      (at_on ?d paris)
      (met_friends)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (in_city ?from)
      (direct ?from ?to)
      (not (visited ?d))
      (not (= ?from ?to))
    )
    :effect (and
      (visited ?d)
      (at_on ?d ?to)
      (not (in_city ?from))
      (in_city ?to)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly_meet_friends
    :parameters (?d - day ?nd - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (in_city ?from)
      (direct ?from paris)
      (not (visited ?d))
      (not (= ?from paris))
      (friends_window ?d)
    )
    :effect (and
      (visited ?d)
      (at_on ?d paris)
      (met_friends)
      (not (in_city ?from))
      (in_city paris)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action finish_stay
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (in_city ?c)
      (not (visited ?d))
    )
    :effect (and
      (visited ?d)
      (at_on ?d ?c)
      (not (current_day ?d))
    )
  )

  (:action finish_stay_meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (in_city paris)
      (not (visited ?d))
      (friends_window ?d)
    )
    :effect (and
      (visited ?d)
      (at_on ?d paris)
      (met_friends)
      (not (current_day ?d))
    )
  )

  (:action finish_fly
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (in_city ?from)
      (direct ?from ?to)
      (not (visited ?d))
      (not (= ?from ?to))
    )
    :effect (and
      (visited ?d)
      (at_on ?d ?to)
      (not (in_city ?from))
      (in_city ?to)
      (not (current_day ?d))
    )
  )

  (:action finish_fly_meet_friends
    :parameters (?d - day ?from - city)
    :precondition (and
      (current_day ?d)
      (in_city ?from)
      (direct ?from paris)
      (not (visited ?d))
      (not (= ?from paris))
      (friends_window ?d)
    )
    :effect (and
      (visited ?d)
      (at_on ?d paris)
      (met_friends)
      (not (in_city ?from))
      (in_city paris)
      (not (current_day ?d))
    )
  )
)
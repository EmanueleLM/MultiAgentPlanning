(define (domain tripplanningexample33_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city)
    (stay_assigned ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at barcelona))
      (not (at krakow))
      (not (at rome))
    )
    :effect (and
      (at ?c)
      (visited ?c)
      (stay_assigned ?c day1)
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (stay_assigned ?c ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (stay_assigned ?c ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (stay_assigned ?from ?d1)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (stay_assigned ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (stay_assigned krakow ?d)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)
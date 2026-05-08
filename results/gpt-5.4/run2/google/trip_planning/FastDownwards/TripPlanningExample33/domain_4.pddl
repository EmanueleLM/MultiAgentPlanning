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

    (visited_on ?c - city ?d - day)

    (friend_window ?d - day)
    (met_friend)

    (started)
    (finished)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (started))
      (not (finished))
    )
    :effect (and
      (started)
      (at ?c)
      (visited_on ?c day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_on barcelona ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited_on barcelona ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (started)
      (not (finished))
      (current_day ?d)
      (at krakow)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (started)
      (not (finished))
      (current_day day13)
    )
    :effect (finished)
  )
)
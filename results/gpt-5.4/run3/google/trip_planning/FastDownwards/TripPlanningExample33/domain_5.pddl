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
    (free_start)
    (stay ?c - city ?d - day)
    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and
      (free_start)
      (current_day day_1)
    )
    :effect (and
      (not (free_start))
      (at ?c)
      (stay ?c day_1)
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (stay ?c ?d1)
      (not (stay barcelona ?d2))
      (not (stay krakow ?d2))
      (not (stay rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (stay ?c ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (stay ?from ?d1)
      (direct ?from ?to)
      (not (= ?from ?to))
      (not (stay barcelona ?d2))
      (not (stay krakow ?d2))
      (not (stay rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (stay ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow)
      (stay krakow ?d)
      (friend_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)
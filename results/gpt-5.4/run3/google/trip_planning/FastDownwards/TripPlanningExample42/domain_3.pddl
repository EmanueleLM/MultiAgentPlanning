(define (domain tripplanningexample42)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (in_city_on ?c - city ?d - day)
    (friends_window ?d - day)
    (met_friends)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?dn)
      (not (in_city_on ?c ?d))
    )
    :effect (and
      (in_city_on ?c ?d)
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action fly_day
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current ?d)
      (next ?d ?dn)
      (not (in_city_on ?from ?d))
    )
    :effect (and
      (in_city_on ?from ?d)
      (not (at ?from))
      (at ?to)
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (at paris)
      (friends_window ?d)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)
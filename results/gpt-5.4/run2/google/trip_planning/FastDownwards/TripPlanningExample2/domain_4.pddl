(define (domain tripplanningexample2)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (in_city_on ?c - city ?d - day)
    (required_city ?d - day ?c - city)
    (wedding_window ?d - day)
    (attended_wedding ?d - day)
    (wedding_done)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d2)
      (required_city ?d ?c)
      (not (in_city_on ?c ?d))
    )
    :effect (and
      (in_city_on ?c ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next_day ?d ?d2)
      (direct ?from ?to)
      (required_city ?d ?to)
      (not (required_city ?d ?from))
      (not (in_city_on ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (in_city_on ?to ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_last
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (last_day ?d)
      (required_city ?d ?c)
      (not (in_city_on ?c ?d))
    )
    :effect (and
      (in_city_on ?c ?d)
      (not (current_day ?d))
    )
  )

  (:action fly_last
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (last_day ?d)
      (direct ?from ?to)
      (required_city ?d ?to)
      (not (required_city ?d ?from))
      (not (in_city_on ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (in_city_on ?to ?d)
      (not (current_day ?d))
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice)
      (required_city ?d venice)
      (wedding_window ?d)
      (not (wedding_done))
      (not (attended_wedding ?d))
    )
    :effect (and
      (attended_wedding ?d)
      (wedding_done)
    )
  )
)
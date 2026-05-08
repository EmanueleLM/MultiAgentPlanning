(define (domain trip_planning_example44)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d - day ?d_next - day)

    (in_city_on ?c - city ?d - day)

    (wedding_window ?d - day)
    (wedding_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (in_city_on ?c ?d)))
    :effect (and
      (in_city_on ?c ?d)
      (not (current_day ?d))
      (current_day ?d_next))
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to)))
    :effect (and
      (not (at ?from))
      (at ?to))
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (at zurich)
      (current_day ?d)
      (wedding_window ?d)
      (not (wedding_attended)))
    :effect (wedding_attended)
  )
)
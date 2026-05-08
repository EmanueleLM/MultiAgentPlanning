(define (domain tripplanningexample45)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    copenhagen lisbon florence - city
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
    (required_city ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_on copenhagen ?d2))
      (not (visited_on lisbon ?d2))
      (not (visited_on florence ?d2))
      (not (required_city ?d2 copenhagen))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action stay_required_copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at copenhagen)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (required_city ?d2 copenhagen)
      (not (visited_on copenhagen ?d2))
      (not (visited_on lisbon ?d2))
      (not (visited_on florence ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on copenhagen ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (visited_on copenhagen ?d2))
      (not (visited_on lisbon ?d2))
      (not (visited_on florence ?d2))
      (not (required_city ?d2 copenhagen))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?to ?d2)
    )
  )

  (:action fly_to_required_copenhagen
    :parameters (?from - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from copenhagen)
      (required_city ?d2 copenhagen)
      (not (visited_on copenhagen ?d2))
      (not (visited_on lisbon ?d2))
      (not (visited_on florence ?d2))
    )
    :effect (and
      (not (at ?from))
      (at copenhagen)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on copenhagen ?d2)
    )
  )
)
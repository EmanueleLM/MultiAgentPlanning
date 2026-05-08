(define (domain travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current_city ?c - city)
    (day ?d - day)
    (visited_city ?c - city)
    (in_lyon ?d - day)
    (in_zurich ?d - day)
    (in_rome ?d - day)
    (flight_available ?from - city ?to - city)
    (wedding_in_zurich ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (current_city ?from)
      (flight_available ?from ?to)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (visited_city ?to)
    )
  )

  (:action stay_in_lyon
    :parameters (?d - day)
    :precondition (and
      (current_city lyon)
    )
    :effect (and
      (in_lyon ?d)
    )
  )

  (:action stay_in_zurich
    :parameters (?d - day)
    :precondition (and
      (current_city zurich)
    )
    :effect (and
      (in_zurich ?d)
    )
  )

  (:action stay_in_rome
    :parameters (?d - day)
    :precondition (and
      (current_city rome)
    )
    :effect (and
      (in_rome ?d)
    )
  )
)
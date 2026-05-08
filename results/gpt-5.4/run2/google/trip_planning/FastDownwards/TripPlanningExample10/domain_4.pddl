(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)
    (spent ?d - day ?c - city)
    (relative_window ?d - day)
    (visited_relatives)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition
      (and
        (at ?from)
        (direct ?from ?to)
        (not (at ?to))
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
      )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (at ?c)
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (not (last_day ?d1))
        (not (spent ?d1 ?c))
      )
    :effect
      (and
        (spent ?d1 ?c)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action stay_visit_relatives
    :parameters (?d1 - day ?d2 - day)
    :precondition
      (and
        (at valencia)
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (relative_window ?d1)
        (not (last_day ?d1))
        (not (spent ?d1 valencia))
        (not (visited_relatives))
      )
    :effect
      (and
        (spent ?d1 valencia)
        (visited_relatives)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action finish
    :parameters (?c - city ?d - day)
    :precondition
      (and
        (at ?c)
        (current_day ?d)
        (last_day ?d)
        (not (spent ?d ?c))
      )
    :effect
      (and
        (spent ?d ?c)
        (not (current_day ?d))
      )
  )

  (:action finish_visit_relatives
    :parameters (?d - day)
    :precondition
      (and
        (at valencia)
        (current_day ?d)
        (last_day ?d)
        (relative_window ?d)
        (not (spent ?d valencia))
        (not (visited_relatives))
      )
    :effect
      (and
        (spent ?d valencia)
        (visited_relatives)
        (not (current_day ?d))
      )
  )
)
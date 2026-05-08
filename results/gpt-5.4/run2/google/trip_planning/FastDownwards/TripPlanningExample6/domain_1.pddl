(define (domain trip_planning_example6)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d - day ?nd - day)
    (current_day ?d - day)
    (visited_on ?d - day ?c - city)
    (closed ?d - day)
  )

  (:action stay
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (at ?c)
      (not (closed ?d))
    )
    :effect (and
      (visited_on ?d ?c)
      (closed ?d)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (at ?from)
      (direct ?from ?to)
      (not (closed ?d))
    )
    :effect (and
      (visited_on ?d ?from)
      (closed ?d)
      (not (current_day ?d))
      (current_day ?nd)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (closed ?d))
    )
    :effect (and
      (visited_on ?d ?c)
      (closed ?d)
    )
  )
)
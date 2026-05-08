(define (domain trip_planning_example40)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (visited_day ?d - day ?c - city)
  )

  (:action stay_for_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (visited_day ?d2 ?c))
    )
    :effect (and
      (visited_day ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_for_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (visited_day ?d2 ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_day ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)
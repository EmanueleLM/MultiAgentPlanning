(define (domain trip_planning_example5)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited_day ?d - day)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (visited_day d1))
    )
    :effect (and
      (at ?c d1)
      (visited_day d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (not (visited_day ?d2))
      (at ?c ?d1)
    )
    :effect (and
      (at ?c ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (not (visited_day ?d2))
      (at ?from ?d1)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?to ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)
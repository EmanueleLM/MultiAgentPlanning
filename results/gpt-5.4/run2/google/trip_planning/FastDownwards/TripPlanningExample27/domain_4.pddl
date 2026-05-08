(define (domain tripplanningexample27)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited_relatives ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (at ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (at ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
    )
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at santorini ?d)
      (not (visited_relatives ?d))
    )
    :effect (visited_relatives ?d)
  )
)
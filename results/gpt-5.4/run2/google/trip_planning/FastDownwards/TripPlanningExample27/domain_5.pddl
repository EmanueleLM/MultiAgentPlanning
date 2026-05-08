(define (domain tripplanningexample27)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (stay_required ?c - city ?d - day)
    (relative_visit_window ?d - day)
    (visited_relatives)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c))
    :effect (and
      (not (today ?d1))
      (today ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (flight ?from ?to))
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (at ?from))
      (at ?to))
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (today ?d)
      (relative_visit_window ?d)
      (at santorini))
    :effect (visited_relatives)
  )
)
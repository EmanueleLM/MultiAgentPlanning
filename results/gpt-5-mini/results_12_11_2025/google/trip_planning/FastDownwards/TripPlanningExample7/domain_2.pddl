(define (domain TripPlanningExample7)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (edge ?from - city ?to - city)
    (day-belongs ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (day-belongs ?d2 ?c)
      (not (at ?c ?d2))
    )
    :effect (at ?c ?d2)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (edge ?from ?to)
      (next ?d ?d2)
      (day-belongs ?d2 ?to)
      (not (at ?to ?d2))
    )
    :effect (at ?to ?d2)
  )
)
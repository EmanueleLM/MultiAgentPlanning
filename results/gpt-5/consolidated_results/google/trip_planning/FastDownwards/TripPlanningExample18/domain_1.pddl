(define (domain tripplanningexample18)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (edge ?c1 - city ?c2 - city)
    (cursor ?d - day)
    (start-pending)
    (init-day ?d - day)
  )

  (:action choose-start
    :parameters (?c - city ?d - day)
    :precondition (and (start-pending) (init-day ?d))
    :effect (and
      (at ?c ?d)
      (cursor ?d)
      (not (start-pending))
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (cursor ?d)
      (next ?d ?d2)
      (at ?c ?d)
    )
    :effect (and
      (at ?c ?d2)
      (cursor ?d2)
      (not (cursor ?d))
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (cursor ?d)
      (next ?d ?d2)
      (at ?from ?d)
      (edge ?from ?to)
    )
    :effect (and
      (at ?to ?d2)
      (cursor ?d2)
      (not (cursor ?d))
    )
  )
)
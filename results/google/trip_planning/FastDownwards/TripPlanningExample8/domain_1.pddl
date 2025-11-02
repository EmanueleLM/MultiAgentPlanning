(define (domain tripplanningexample8)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current-day ?d - day)
    (next ?d - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (scheduled ?c - city ?d - day)
    (visited ?c - city)
  )

  (:action stay-one-day
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (next ?d ?d2)
      (at ?c ?d)
      (scheduled ?c ?d)
      (scheduled ?c ?d2)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (not (at ?c ?d))
      (at ?c ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?src - city ?dst - city ?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (next ?d ?d2)
      (at ?src ?d)
      (direct ?src ?dst)
      (scheduled ?src ?d)
      (scheduled ?dst ?d2)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (not (at ?src ?d))
      (at ?dst ?d2)
      (visited ?src)
      (visited ?dst)
    )
  )
)
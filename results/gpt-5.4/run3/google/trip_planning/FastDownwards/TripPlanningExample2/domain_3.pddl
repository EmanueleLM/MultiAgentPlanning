(define (domain tripplanningexample2)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (started)
  )

  (:action start_in_reykjavik
    :parameters ()
    :precondition (not (started))
    :effect (and
      (started)
      (current_day day1)
      (at reykjavik day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at reykjavik ?d2))
      (not (at vienna ?d2))
      (not (at venice ?d2))
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
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at reykjavik ?d2))
      (not (at vienna ?d2))
      (not (at venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
)
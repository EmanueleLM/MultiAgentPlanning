(define (domain tripplanningexample2)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (in ?c - city ?d - day)
    (current_day ?d - day)
    (started)
    (visited_reykjavik)
    (visited_vienna)
    (visited_venice)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (not (started))
    :effect (and
      (started)
      (current_day day1)
      (in ?c day1)
      (visited_reykjavik)
      (visited_vienna)
      (visited_venice)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (in ?c ?d1)
      (not (in reykjavik ?d2))
      (not (in vienna ?d2))
      (not (in venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (in ?from ?d1)
      (direct ?from ?to)
      (not (in reykjavik ?d2))
      (not (in vienna ?d2))
      (not (in venice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?to ?d2)
    )
  )
)
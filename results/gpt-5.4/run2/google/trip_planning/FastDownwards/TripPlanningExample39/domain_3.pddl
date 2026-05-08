(define (domain tripplanningexample39)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited_on ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (visited_on ?d1 ?c)
      (not (visited_on ?d2 porto))
      (not (visited_on ?d2 barcelona))
      (not (visited_on ?d2 florence))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (visited_on ?d1 ?from)
      (direct_flight ?from ?to)
      (not (visited_on ?d2 porto))
      (not (visited_on ?d2 barcelona))
      (not (visited_on ?d2 florence))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?d2 ?to)
    )
  )
)
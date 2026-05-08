(define (domain tripplanningexample24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)

    (visited_day ?d - day ?c - city)

    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay_and_attend_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence)
      (workshop_day ?d1)
      (not (workshop_attended))
      (not (visited_day ?d1 florence))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d1 florence)
      (workshop_attended)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_day ?d1 ?c))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d1 ?c)
    )
  )

  (:action fly
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
      (not (visited_day ?d florence))
      (not (visited_day ?d amsterdam))
      (not (visited_day ?d riga))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)
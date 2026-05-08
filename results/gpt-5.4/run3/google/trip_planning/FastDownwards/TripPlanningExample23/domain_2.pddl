(define (domain tripplanningexample23)
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

    (visited_on ?c - city ?d - day)
    (workshop_day ?d - day)
    (workshop_attended_on ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
      (not (visited_on ?c ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d)
      (next ?d ?d2)
      (not (visited_on ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at riga)
      (workshop_day ?d)
      (current_day ?d)
      (next ?d ?d2)
      (not (visited_on riga ?d))
      (not (workshop_attended_on ?d))
    )
    :effect (and
      (visited_on riga ?d)
      (workshop_attended_on ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )
)
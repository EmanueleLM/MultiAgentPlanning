(define (domain tripplanningexample9)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current ?d - day)
    (final_day ?d - day)

    (at ?c - city)
    (in ?c - city ?d - day)

    (visited_bucharest)
    (visited_frankfurt)
    (visited_stuttgart)

    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (current day1)
      (not (at bucharest))
      (not (at frankfurt))
      (not (at stuttgart))
      (not (in bucharest day1))
      (not (in frankfurt day1))
      (not (in stuttgart day1))
    )
    :effect (and
      (at ?c)
      (in ?c day1)
      (visited_bucharest)
      (visited_frankfurt)
      (visited_stuttgart)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (in ?c ?d1)
      (not (final_day ?d1))
      (not (in bucharest ?d2))
      (not (in frankfurt ?d2))
      (not (in stuttgart ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (in ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (in ?from ?d1)
      (direct ?from ?to)
      (not (final_day ?d1))
      (not (in bucharest ?d2))
      (not (in frankfurt ?d2))
      (not (in stuttgart ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (in ?to ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (workshop_window ?d)
      (at stuttgart)
      (in stuttgart ?d)
      (not (workshop_attended))
    )
    :effect (and
      (workshop_attended)
    )
  )
)
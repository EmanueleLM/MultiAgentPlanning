(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (visited_on ?d - day ?c - city)
    (workshop_window ?d - day)
    (attended_workshop)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at london))
      (not (at bucharest))
      (not (at riga))
      (not (visited_on day_1 london))
      (not (visited_on day_1 bucharest))
      (not (visited_on day_1 riga))
    )
    :effect (and
      (at ?c)
      (visited_on day_1 ?c)
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (visited_on ?d2 london))
      (not (visited_on ?d2 bucharest))
      (not (visited_on ?d2 riga))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?d2 ?c)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited_on ?d2 london))
      (not (visited_on ?d2 bucharest))
      (not (visited_on ?d2 riga))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?d2 ?to)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (workshop_window ?d)
      (current_day ?d)
      (at riga)
      (visited_on ?d riga)
      (not (attended_workshop))
    )
    :effect (attended_workshop)
  )
)
(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited_on ?d - day ?c - city)
    (workshop_window ?d - day)
    (workshop_attended ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at london))
      (not (at bucharest))
      (not (at riga))
      (not (visited_on day1 london))
      (not (visited_on day1 bucharest))
      (not (visited_on day1 riga))
    )
    :effect (and
      (at ?c)
      (visited_on day1 ?c)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
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

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
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
      (current_day ?d)
      (workshop_window ?d)
      (at riga)
      (visited_on ?d riga)
      (not (workshop_attended day5))
      (not (workshop_attended day6))
      (not (workshop_attended day7))
      (not (workshop_attended day8))
    )
    :effect (workshop_attended ?d)
  )
)
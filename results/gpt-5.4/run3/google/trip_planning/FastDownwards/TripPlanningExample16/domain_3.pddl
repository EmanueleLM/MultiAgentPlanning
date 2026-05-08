(define (domain trip_planning_example16)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)

    (visited_day ?c - city ?d - day)

    (required_workshop_day ?d - day)
    (workshop_done)

    (total_complete)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2))
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited_day ?c ?d1))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current ?d1)
      (next ?d1 ?d2))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (visited_day ?from ?d1))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (at prague)
      (current ?d)
      (required_workshop_day ?d)
      (not (workshop_done)))
    :effect (workshop_done)
  )

  (:action finish_last_day
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (current day10)
      (not (total_complete)))
    :effect (and
      (visited_day ?c day10)
      (total_complete))
  )
)
(define (domain trip_planning_example35)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited ?c - city ?d - day)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current day_1)
      (not (at bucharest))
      (not (at zurich))
      (not (at dubrovnik)))
    :effect (and
      (at ?c)
      (visited ?c day_1))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2))
    :effect (and
      (current ?d2)
      (not (current ?d1))
      (visited ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (flight ?from ?to)
      (current ?d1)
      (next ?d1 ?d2))
    :effect (and
      (not (at ?from))
      (at ?to)
      (current ?d2)
      (not (current ?d1))
      (visited ?to ?d2))
  )
)
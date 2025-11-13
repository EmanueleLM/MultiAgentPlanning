(define (domain trip-ten-day)
  (:requirements :strips :typing)
  (:types
    day
    city
    venice-city - city
  )
  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (window ?d - day)
    (attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (visited ?c)
      (current-day ?d2)
      (not (current-day ?d))
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (at ?to)
      (visited ?to)
      (current-day ?d2)
      (not (at ?from))
      (not (current-day ?d))
    )
  )

  (:action attend-workshop
    :parameters (?v - venice-city ?d - day ?d2 - day)
    :precondition (and
      (at ?v)
      (window ?d)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (attended)
      (visited ?v)
      (current-day ?d2)
      (not (current-day ?d))
    )
  )
)
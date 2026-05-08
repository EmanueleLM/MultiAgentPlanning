(define (domain tripplanningexample31)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current ?d - day)
    (next ?d - day ?nd - day)
    (visited ?c - city ?d - day)
    (workshop_day ?d - day)
    (attended_workshop)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?nd)
      (not (visited ?c ?d))
    )
    :effect (and
      (visited ?c ?d)
      (not (current ?d))
      (current ?nd)
    )
  )

  (:action stay_and_attend_workshop
    :parameters (?d - day ?nd - day)
    :precondition (and
      (at reykjavik)
      (current ?d)
      (next ?d ?nd)
      (workshop_day ?d)
      (not (visited reykjavik ?d))
      (not (attended_workshop))
    )
    :effect (and
      (visited reykjavik ?d)
      (attended_workshop)
      (not (current ?d))
      (current ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current ?d)
      (next ?d ?nd)
      (not (visited ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d)
      (not (current ?d))
      (current ?nd)
    )
  )

  (:action fly_and_attend_workshop
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (direct ?from reykjavik)
      (current ?d)
      (next ?d ?nd)
      (workshop_day ?d)
      (not (visited reykjavik ?d))
      (not (attended_workshop))
    )
    :effect (and
      (not (at ?from))
      (at reykjavik)
      (visited reykjavik ?d)
      (attended_workshop)
      (not (current ?d))
      (current ?nd)
    )
  )
)
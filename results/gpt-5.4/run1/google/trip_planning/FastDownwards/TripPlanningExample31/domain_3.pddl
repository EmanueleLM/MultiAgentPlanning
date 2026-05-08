(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d - day ?nd - day)
    (stayed ?c - city ?d - day)
    (workshop_day ?d - day)
    (attended_workshop)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (not (stayed ?c ?d))
    )
    :effect (and
      (stayed ?c ?d)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action attend_workshop_by_staying
    :parameters (?d - day ?nd - day)
    :precondition (and
      (at reykjavik)
      (current_day ?d)
      (next_day ?d ?nd)
      (workshop_day ?d)
      (not (stayed reykjavik ?d))
      (not (attended_workshop))
    )
    :effect (and
      (stayed reykjavik ?d)
      (attended_workshop)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current_day ?d)
      (next_day ?d ?nd)
      (not (stayed ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (stayed ?to ?d)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action attend_workshop_by_flying
    :parameters (?from - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (direct ?from reykjavik)
      (current_day ?d)
      (next_day ?d ?nd)
      (workshop_day ?d)
      (not (stayed reykjavik ?d))
      (not (attended_workshop))
    )
    :effect (and
      (not (at ?from))
      (at reykjavik)
      (stayed reykjavik ?d)
      (attended_workshop)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )
)
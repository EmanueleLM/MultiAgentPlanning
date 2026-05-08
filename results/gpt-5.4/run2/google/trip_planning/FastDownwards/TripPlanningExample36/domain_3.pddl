(define (domain tripplanningexample36)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d ?dn - day)
    (current_day ?d - day)
    (at ?c - city)
    (assigned ?d - day ?c - city)
    (final_day ?d - day)
    (trip_finished)
  )

  (:action stay
    :parameters (?d - day ?dn - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at ?c)
      (not (assigned ?d florence))
      (not (assigned ?d munich))
      (not (assigned ?d warsaw))
      (not (trip_finished))
    )
    :effect (and
      (assigned ?d ?c)
      (current_day ?dn)
      (not (current_day ?d))
    )
  )

  (:action fly
    :parameters (?d - day ?dn - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at ?from)
      (direct ?from ?to)
      (not (assigned ?d florence))
      (not (assigned ?d munich))
      (not (assigned ?d warsaw))
      (not (trip_finished))
    )
    :effect (and
      (assigned ?d ?to)
      (at ?to)
      (current_day ?dn)
      (not (at ?from))
      (not (current_day ?d))
    )
  )

  (:action finish_stay
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (at ?c)
      (not (assigned ?d florence))
      (not (assigned ?d munich))
      (not (assigned ?d warsaw))
      (not (trip_finished))
    )
    :effect (and
      (assigned ?d ?c)
      (trip_finished)
      (not (current_day ?d))
    )
  )

  (:action finish_fly
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (at ?from)
      (direct ?from ?to)
      (not (assigned ?d florence))
      (not (assigned ?d munich))
      (not (assigned ?d warsaw))
      (not (trip_finished))
    )
    :effect (and
      (assigned ?d ?to)
      (at ?to)
      (trip_finished)
      (not (at ?from))
      (not (current_day ?d))
    )
  )
)
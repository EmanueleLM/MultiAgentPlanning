(define (domain trip_planning_example11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d - day ?dn - day)
    (assigned ?d - day ?c - city)
    (conference_day ?d - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at ?c)
        (assigned ?d ?c)
        (not (conference_day ?d))
      )
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
      )
  )

  (:action stay_conference
    :parameters (?c - city ?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at ?c)
        (assigned ?d ?c)
        (conference_day ?d)
        (at valencia)
      )
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at ?from)
        (direct ?from ?to)
        (assigned ?d ?to)
        (not (conference_day ?d))
        (not (at ?to))
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
        (visited ?to)
        (not (current_day ?d))
        (current_day ?dn)
      )
  )
)
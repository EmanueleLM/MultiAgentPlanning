(define (domain trip_planning_example11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (today ?d - day)
    (next ?d1 - day ?d2 - day)
    (stay_day ?d - day ?c - city)
    (conference_day ?d - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition
      (and
        (today ?d)
        (next ?d ?dn)
        (at ?c)
        (stay_day ?d ?c)
        (not (conference_day ?d))
      )
    :effect
      (and
        (not (today ?d))
        (today ?dn)
        (visited ?c)
      )
  )

  (:action stay_conference
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (today ?d)
        (next ?d ?dn)
        (conference_day ?d)
        (at valencia)
        (stay_day ?d valencia)
      )
    :effect
      (and
        (not (today ?d))
        (today ?dn)
        (visited valencia)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition
      (and
        (today ?d)
        (next ?d ?dn)
        (at ?from)
        (direct ?from ?to)
        (stay_day ?d ?to)
        (not (conference_day ?d))
        (not (at ?to))
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
        (visited ?to)
        (not (today ?d))
        (today ?dn)
      )
  )
)
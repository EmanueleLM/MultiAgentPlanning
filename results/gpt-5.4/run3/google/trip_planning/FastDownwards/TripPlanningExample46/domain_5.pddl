(define (domain trip_planning_example46)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    staylen
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (final_day ?d - day)

    (current_day ?d - day)
    (at ?c - city)

    (required_city ?d - day ?c - city)

    (visited ?c - city)
    (days_used ?c - city ?n - staylen)
    (succ_len ?n1 - staylen ?n2 - staylen)
  )

  (:action stay
    :parameters (?d - day ?dn - day ?c - city ?n1 - staylen ?n2 - staylen)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at ?c)
      (days_used ?c ?n1)
      (succ_len ?n1 ?n2)
      (required_city ?d ?c)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (days_used ?c ?n1))
      (days_used ?c ?n2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?d - day ?dn - day ?from - city ?to - city ?n1 - staylen ?n2 - staylen)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at ?from)
      (direct ?from ?to)
      (days_used ?from ?n1)
      (succ_len ?n1 ?n2)
      (required_city ?d ?from)
      (not (required_city ?dn ?from))
      (required_city ?dn ?to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (at ?from))
      (at ?to)
      (not (days_used ?from ?n1))
      (days_used ?from ?n2)
      (visited ?from)
      (visited ?to)
    )
  )

  (:action stay_last
    :parameters (?d - day ?c - city ?n1 - staylen ?n2 - staylen)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (at ?c)
      (days_used ?c ?n1)
      (succ_len ?n1 ?n2)
      (required_city ?d ?c)
    )
    :effect (and
      (not (current_day ?d))
      (not (days_used ?c ?n1))
      (days_used ?c ?n2)
      (visited ?c)
    )
  )
)
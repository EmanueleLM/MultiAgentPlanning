(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next-day ?d1 - day ?d2 - day)
    (met-friend)
    (day-range9-15 ?d - day)
    (is-valencia ?c - city)
    (is-amsterdam ?c - city)
    (is-tallinn ?c - city)
  )

  (:action valencia_agent-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (at ?c ?d1) (is-valencia ?c) (next-day ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action valencia_agent-fly-valencia-to-amsterdam
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (at ?from ?d1) (is-valencia ?from) (is-amsterdam ?to) (direct ?from ?to) (next-day ?d1 ?d2))
    :effect (and (at ?to ?d2))
  )

  (:action amsterdam_agent-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (at ?c ?d1) (is-amsterdam ?c) (next-day ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action amsterdam_agent-fly-amsterdam-to-tallinn
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (at ?from ?d1) (is-amsterdam ?from) (is-tallinn ?to) (direct ?from ?to) (next-day ?d1 ?d2))
    :effect (and (at ?to ?d2))
  )

  (:action amsterdam_agent-fly-amsterdam-to-valencia
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (at ?from ?d1) (is-amsterdam ?from) (is-valencia ?to) (direct ?from ?to) (next-day ?d1 ?d2))
    :effect (and (at ?to ?d2))
  )

  (:action tallinn_agent-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (at ?c ?d1) (is-tallinn ?c) (next-day ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action tallinn_agent-meet-friend
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is-tallinn ?c) (day-range9-15 ?d) (not (met-friend)))
    :effect (and (met-friend))
  )
)
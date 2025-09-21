(define (domain traveler-flights-domain)
  (:requirements :typing :negative-preconditions :equality :action-costs)
  (:types city day token)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (is-reykjavik ?c - city)
    (met-friend)

    (direct-flight ?from - city ?to - city)
    (connectivity-known ?from - city ?to - city)
    (direct-commuting-only)

    (day-current ?d - day)
    (next-day ?d1 - day ?d2 - day)

    (token-available ?t - token)
    (token-for-city ?t - token ?c - city)

    (allowed-meeting ?d - day)
  )

  (:action announce-connection
    :parameters (?from - city ?to - city)
    :precondition (and (direct-flight ?from ?to))
    :effect (and (connectivity-known ?from ?to))
    :cost 0
  )

  (:action assert-direct-commuting-constraint
    :parameters ()
    :precondition (and)
    :effect (and (direct-commuting-only))
    :cost 0
  )

  (:action register-direct
    :parameters (?from - city ?to - city)
    :precondition (and (connectivity-known ?from ?to))
    :effect (and (direct ?from ?to))
    :cost 0
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (direct-commuting-only))
    :effect (and (not (at ?from)) (at ?to))
    :cost 1
  )

  (:action stay-day
    :parameters (?c - city ?t - token ?d1 - day ?d2 - day)
    :precondition (and (at ?c) (token-available ?t) (token-for-city ?t ?c) (day-current ?d1) (next-day ?d1 ?d2))
    :effect (and (not (token-available ?t)) (not (day-current ?d1)) (day-current ?d2))
    :cost 0
  )

  (:action meet-friend-in-reykjavik
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c) (is-reykjavik ?c) (not (met-friend)) (day-current ?d) (allowed-meeting ?d))
    :effect (and (met-friend))
    :cost 0
  )
)
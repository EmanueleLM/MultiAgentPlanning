(define (domain traveler-flights-domain)
  (:requirements :typing)
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
    (token-used ?t - token)
  )

  (:action announce-connection
    :parameters (?from - city ?to - city)
    :precondition (and (direct-flight ?from ?to))
    :effect (and (connectivity-known ?from ?to))
  )

  (:action assert-direct-commuting-constraint
    :parameters ()
    :precondition (and)
    :effect (and (direct-commuting-only))
  )

  (:action register-direct
    :parameters (?from - city ?to - city)
    :precondition (and (connectivity-known ?from ?to))
    :effect (and (direct ?from ?to))
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to) (direct-commuting-only))
    :effect (and (at ?to))
  )

  (:action stay-day
    :parameters (?c - city ?t - token ?d1 - day ?d2 - day)
    :precondition (and (at ?c) (token-available ?t) (token-for-city ?t ?c) (day-current ?d1) (next-day ?d1 ?d2))
    :effect (and (token-used ?t) (day-current ?d2))
  )

  (:action meet-friend-in-reykjavik
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c) (is-reykjavik ?c) (day-current ?d) (allowed-meeting ?d))
    :effect (and (met-friend))
  )
)
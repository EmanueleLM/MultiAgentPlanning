(define (domain combined-travel-symbolic)
  (:requirements :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at-person ?p - person ?c - city)
    (agent2_at ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (direct-flight ?from - city ?to - city)
    (at-day ?d - day)
    (span ?c - city ?from - day ?to - day)
    (is-show-city ?c - city)
    (attended-show)
  )

  (:action agent1_fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and
      (at-person ?p ?from)
      (flight ?from ?to)
    )
    :effect (and
      (not (at-person ?p ?from))
      (at-person ?p ?to)
    )
  )

  (:action agent1_stay
    :parameters (?p - person ?c - city ?from - day ?to - day)
    :precondition (and
      (at-person ?p ?c)
      (at-day ?from)
      (span ?c ?from ?to)
      (not (visited ?c))
    )
    :effect (and
      (visited ?c)
      (not (at-day ?from))
      (at-day ?to)
    )
  )

  (:action agent1_stay_show
    :parameters (?p - person ?c - city ?from - day ?to - day)
    :precondition (and
      (at-person ?p ?c)
      (at-day ?from)
      (span ?c ?from ?to)
      (not (visited ?c))
      (is-show-city ?c)
    )
    :effect (and
      (visited ?c)
      (attended-show)
      (not (at-day ?from))
      (at-day ?to)
    )
  )

  (:action agent2_fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (agent2_at ?from)
      (direct-flight ?from ?to)
    )
    :effect (and
      (not (agent2_at ?from))
      (agent2_at ?to)
      (visited ?to)
    )
  )
)
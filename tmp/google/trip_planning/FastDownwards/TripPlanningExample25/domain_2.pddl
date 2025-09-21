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
    (span-valencia ?from - day ?to - day)
    (span-lyon ?from - day ?to - day)
    (span-split ?from - day ?to - day)
    (attended-show)
  )

  (:action agent1_fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at-person traveler ?from)
      (flight ?from ?to)
    )
    :effect (and
      (not (at-person traveler ?from))
      (at-person traveler ?to)
    )
  )

  (:action agent1_stay-valencia
    :parameters (?from - day ?to - day)
    :precondition (and
      (at-person traveler valencia)
      (at-day ?from)
      (span-valencia ?from ?to)
      (not (visited valencia))
    )
    :effect (and
      (visited valencia)
      (not (at-day ?from))
      (at-day ?to)
    )
  )

  (:action agent1_stay-lyon
    :parameters (?from - day ?to - day)
    :precondition (and
      (at-person traveler lyon)
      (at-day ?from)
      (span-lyon ?from ?to)
      (not (visited lyon))
    )
    :effect (and
      (visited lyon)
      (not (at-day ?from))
      (at-day ?to)
    )
  )

  (:action agent1_stay-split
    :parameters (?from - day ?to - day)
    :precondition (and
      (at-person traveler split)
      (at-day ?from)
      (span-split ?from ?to)
      (not (visited split))
    )
    :effect (and
      (visited split)
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
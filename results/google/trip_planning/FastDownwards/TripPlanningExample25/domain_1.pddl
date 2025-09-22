(define (domain combined-travel-symbolic)
  (:requirements :strips :typing :negative-preconditions :action-costs)
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

  ;; Agent 1: traveler fly (instantaneous, keeps actions distinct)
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
    :cost 1
  )

  ;; Agent 1: stay in Valencia consuming a span from ?from to ?to
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
    :cost 1
  )

  ;; Agent 1: stay in Lyon consuming a span from ?from to ?to
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
    :cost 1
  )

  ;; Agent 1: stay in Split must start at an approved span (precomputed to enforce start on day10)
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
    :cost 1
  )

  ;; Agent 2: fly using direct-flight facts (keeps agent2 actions distinct)
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
    :cost 1
  )
)
(define (domain combined-travel)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types person city)

  (:predicates
    ;; Agent 1 (traveler) local location predicate
    (at-person ?p - person ?c - city)
    ;; Agent 2 (connectivity agent) local location predicate
    (agent2_at ?c - city)

    ;; Shared facts about cities
    (visited ?c - city)
    (flight ?from - city ?to - city)         ; agent1's flight topology facts
    (direct-flight ?from - city ?to - city)  ; agent2's flight/topology facts
    (attended-show)
  )

  (:functions
    (day)                 ; current day counter (numeric)
    (dur-valencia)
    (dur-lyon)
    (dur-split)
    (total-trip-length)
  )

  ;; Agent 1: traveler fly action (keeps agent1 actions distinct)
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

  ;; Agent 1: stay in Valencia (consumes dur-valencia)
  (:action agent1_stay-valencia
    :precondition (and
      (at-person traveler valencia)
      (not (visited valencia))
    )
    :effect (and
      (visited valencia)
      (increase (day) (dur-valencia))
    )
  )

  ;; Agent 1: stay in Lyon (consumes dur-lyon)
  (:action agent1_stay-lyon
    :precondition (and
      (at-person traveler lyon)
      (not (visited lyon))
    )
    :effect (and
      (visited lyon)
      (increase (day) (dur-lyon))
    )
  )

  ;; Agent 1: stay in Split, must start on day 10 to attend full show run (10..16)
  ;; We use numeric bounds to require day == 10 before starting the Split stay.
  (:action agent1_stay-split
    :precondition (and
      (at-person traveler split)
      (not (visited split))
      (>= (day) 10)
      (<= (day) 10)
    )
    :effect (and
      (visited split)
      (attended-show)
      (increase (day) (dur-split))
    )
  )

  ;; Agent 2: generic fly action (keeps agent2 actions distinct)
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
(define (domain multi-city-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                                 ; agent is in city on day
    (agent-direct-flight ?from - city ?to - city)          ; direct flight exists between cities (namespaced)
    (day-next ?d - day ?dn - day)                          ; sequential day relation
    (day-first ?d - day)                                   ; marks the first day (day 1)
  )

  ;; Start assignment on day 1 to a city (only if day unassigned)
  (:action agent-start-assign
    :parameters (?c - city ?d - day)
    :precondition (and
      (day-first ?d)
      (not (at berlin ?d))
      (not (at porto ?d))
      (not (at krakow ?d))
    )
    :effect (and
      (at ?c ?d)
    )
  )

  ;; Stay in the same city from day d to next day dn (only if next day unassigned)
  (:action agent-stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c ?d)
      (day-next ?d ?dn)
      (not (at berlin ?dn))
      (not (at porto ?dn))
      (not (at krakow ?dn))
    )
    :effect (and
      (at ?c ?dn)
    )
  )

  ;; Travel between cities using direct flights (only if next day unassigned and direct flight exists)
  (:action agent-travel
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from ?d)
      (agent-direct-flight ?from ?to)
      (day-next ?d ?dn)
      (not (at berlin ?dn))
      (not (at porto ?dn))
      (not (at krakow ?dn))
    )
    :effect (and
      (at ?to ?dn)
    )
  )
)
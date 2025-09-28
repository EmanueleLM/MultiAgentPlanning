(define (domain travel-domain)
  (:requirements :strips :typing)
  (:types agent city day)
  (:predicates
    (at ?p - agent ?c - city ?d - day)        ; agent p is in city c on day d
    (direct ?from - city ?to - city)         ; there is a direct flight from->to
    (succ ?d1 - day ?d2 - day)               ; successor day relation (d1 -> d2)
  )

  ;; Actions are agent-specific (traveler). Each action ensures the (at ...) fact
  ;; for the previous city/day is deleted and the new (at ...) fact is added.
  ;; stay_traveler: remain in same city into next day
  (:action stay_traveler
    :parameters (?p - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (succ ?d1 ?d2))
    :effect (and (not (at ?p ?c ?d1)) (at ?p ?c ?d2))
  )

  ;; fly_same_day_traveler: take a direct flight and arrive the same day (allows chaining direct legs within a day)
  (:action fly_same_day_traveler
    :parameters (?p - agent ?from - city ?to - city ?d - day)
    :precondition (and (at ?p ?from ?d) (direct ?from ?to))
    :effect (and (not (at ?p ?from ?d)) (at ?p ?to ?d))
  )

  ;; fly_next_day_traveler: take a direct flight overnight and arrive the next day
  (:action fly_next_day_traveler
    :parameters (?p - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?from ?d1) (direct ?from ?to) (succ ?d1 ?d2))
    :effect (and (not (at ?p ?from ?d1)) (at ?p ?to ?d2))
  )
)
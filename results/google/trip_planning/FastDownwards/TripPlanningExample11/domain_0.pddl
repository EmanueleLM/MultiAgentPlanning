(define (domain trip-planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (not-started)
    (current ?d - day)
    (at ?c - city)
    (at-day ?c - city ?d - day)    ; recorded presence at city on a given day
    (visited ?c - city)            ; visited at least one day
    (direct-flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  ;; Traveler actions (must be distinct from flight-network actions)
  (:action traveler-start
    :parameters (?c - city)
    :precondition (and (not-started))
    :effect (and
      (not (not-started))
      (current day1)
      (at ?c)
      (at-day ?c day1)
      (visited ?c)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (at ?c) (next ?d1 ?d2))
    :effect (and
      (not (current ?d1))
      (current ?d2)
      ;; remain at same city; record presence for the new day
      (at ?c)
      (at-day ?c ?d2)
      (visited ?c)
    )
  )

  ;; Flight-network actions (distinct agent actions that implement direct flights)
  (:action flight_network-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (at ?from) (direct-flight ?from ?to) (next ?d1 ?d2))
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      ;; arrival at destination is recorded for the new day
      (at-day ?to ?d2)
      (visited ?to)
    )
  )
)
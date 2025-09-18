(define (domain integrated-travel)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (workshop-attended)
    (current ?d - day)
    (advance2 ?d1 - day ?d2 - day)
    (advance6 ?d1 - day ?d2 - day)
  )

  (:functions
    (total-cost)
  )

  ;; Flight action coming from the "flight" agent fragment (kept distinct)
  (:action fly-flight
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct ?from ?to))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Flight action coming from the "traveler" fragment (kept distinct)
  (:action fly-traveler
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct ?from ?to))
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Stay actions as instantaneous transitions between explicit day objects
  ;; Mykonos: 2 days
  (:action stay-mykonos
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a mykonos) (current ?d1) (advance2 ?d1 ?d2))
    :effect (and
      (visited mykonos)
      (not (current ?d1))
      (current ?d2)
    )
  )

  ;; Vienna: 2 days
  (:action stay-vienna
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a vienna) (current ?d1) (advance2 ?d1 ?d2))
    :effect (and
      (visited vienna)
      (not (current ?d1))
      (current ?d2)
    )
  )

  ;; Venice: 6 days
  (:action stay-venice
    :parameters (?a - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?a venice) (current ?d1) (advance6 ?d1 ?d2))
    :effect (and
      (visited venice)
      (not (current ?d1))
      (current ?d2)
    )
  )

  ;; Attend workshop in Venice (must be at Venice and current day in [day5..day10])
  (:action attend-workshop
    :parameters (?a - agent ?d - day)
    :precondition (and
      (at ?a venice)
      (or
        (current day5)
        (current day6)
        (current day7)
        (current day8)
        (current day9)
        (current day10)
      )
    )
    :effect (and (workshop-attended))
  )
)
(define (domain TripPlanningExample7)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (next ?d1 - day ?d2 - day)        ; successor relation on days (discrete timeline)
    (at ?c - city ?d - day)           ; located in city ?c on day ?d
    (edge ?from - city ?to - city)    ; allowed directed flight edge
    (day-belongs ?d - day ?c - city)  ; enforces that day ?d must be spent in city ?c
  )

  ;; Stay: remain in the same city from day ?d to its successor ?d2,
  ;; only allowed if the successor day is allocated to the same city.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (day-belongs ?d2 ?c)
      (not (at ?c ?d2))
    )
    :effect (at ?c ?d2)
  )

  ;; Fly: take a direct flight from ?from to ?to between consecutive days,
  ;; allowed only on declared directed edges and only if the successor day
  ;; is allocated to the destination city.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (edge ?from ?to)
      (next ?d ?d2)
      (day-belongs ?d2 ?to)
      (not (at ?to ?d2))
    )
    :effect (at ?to ?d2)
  )
)
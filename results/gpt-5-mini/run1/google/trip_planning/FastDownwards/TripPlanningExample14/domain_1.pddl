(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)        ; person is in city during day
    (next ?d1 - day ?d2 - day)                ; d2 follows d1
    (flight ?c1 - city ?c2 - city)            ; direct flight leg exists c1 -> c2
    (two_leg ?c1 - city ?via - city ?c2 - city) ; allowed same-calendar-day two-leg transfer c1->via->c2
    (show-in ?c - city ?d - day)              ; a show occurs in city on day
    (attended ?d - day)                       ; show on day has been attended
  )

  ;---------------------------
  ; Itinerary planner actions
  ;---------------------------

  ;; Stay in the same city from one day to the next
  (:action itinerary_planner-stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?p ?c ?d2)
    )
  )

  ;; Attend a show that occurs in the current city on the same day
  (:action itinerary_planner-attend-show
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and
      (at ?p ?c ?d)
      (show-in ?c ?d)
      (not (attended ?d))
    )
    :effect (and
      (attended ?d)
    )
  )

  ;---------------------------
  ; Flight connector actions
  ;---------------------------

  ;; Take a direct flight (one-leg) between two cities across consecutive days
  (:action flight_connector-fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (flight ?from ?to)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?p ?to ?d2)
    )
  )

  ;; Execute a same-calendar-day two-leg transfer (from -> via -> to),
  ;; resulting in being in the destination on the next day slot.
  ;; This encodes the feasible commuting sequence that uses two direct flights
  ;; within one calendar day boundary when needed by the itinerary.
  (:action flight_connector-two-leg-transfer
    :parameters (?p - person ?from - city ?via - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (two_leg ?from ?via ?to)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?p ?to ?d2)
    )
  )
)
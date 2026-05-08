(define (domain travel_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  ;; Concrete city constants (instance-specific)
  (:constants lyon frankfurt krakow - city)

  (:predicates
    (at ?p - person ?c - city ?d - day)        ; person is in city during day
    (next ?d1 - day ?d2 - day)                ; d2 follows d1
    (flight ?c1 - city ?c2 - city)            ; direct flight leg exists c1 -> c2
    (two_leg ?c1 - city ?via - city ?c2 - city) ; allowed same-calendar-day two-leg transfer sequence
    (show_in ?c - city ?d - day)              ; a show occurs in city on day
    (attended ?d - day)                       ; show on day has been attended
  )

  ;; stay in the same city from one day to the next
  ;; ensure the target-day has no recorded location yet (exclusivity)
  (:action stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?c ?d1)
      (next ?d1 ?d2)
      (not (at ?p lyon ?d2))
      (not (at ?p frankfurt ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p ?c ?d2)
    )
  )

  ;; take a direct (overnight) flight from one city to another,
  ;; arriving on the next day slot
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (flight ?from ?to)
      (next ?d1 ?d2)
      (not (at ?p lyon ?d2))
      (not (at ?p frankfurt ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p ?to ?d2)
    )
  )

  ;; same-calendar-day two-leg transfer (from -> via -> to),
  ;; allowed as a single planning action that yields presence at destination on the next day
  (:action two_leg_transfer
    :parameters (?p - person ?from - city ?via - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (two_leg ?from ?via ?to)
      (next ?d1 ?d2)
      (not (at ?p lyon ?d2))
      (not (at ?p frankfurt ?d2))
      (not (at ?p krakow ?d2))
    )
    :effect (and
      (at ?p ?to ?d2)
    )
  )

  ;; attend a show in the current city on the same day (record attendance once per day)
  (:action attend_show
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and
      (at ?p ?c ?d)
      (show_in ?c ?d)
      (not (attended ?d))
    )
    :effect (and
      (attended ?d)
    )
  )
)
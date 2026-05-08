(define (domain trip)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    ;; basic objects
    (day ?d - day)
    (next ?d1 - day ?d2 - day)

    (city ?c - city)
    (direct ?c1 - city ?c2 - city)

    ;; timeline assignment predicates
    ;; has-location = non-travel presence in a city on a day
    (has-location ?c - city ?d - day)

    ;; in-transit marks a travel (flight) day (strict semantics: travel day is not a stay day)
    (in-transit ?d - day)

    ;; bookkeeping to ensure each day is assigned exactly once
    (free ?d - day)      ;; day still unassigned
    (assigned ?d - day)  ;; day has been assigned (either in-transit or has-location)
  )

  ;; Stay from one day to the immediate successor day (consumes the successor day)
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (has-location ?c ?d1)
      (next ?d1 ?d2)
      (free ?d2)
    )
    :effect (and
      (not (free ?d2))
      (assigned ?d2)
      (has-location ?c ?d2)
    )
  )

  ;; Fly: a one-day travel that occurs on ?dflight (in-transit) and results in presence
  ;; at the destination on the following day ?darr. Both the travel day and the arrival day
  ;; must be free at the time of scheduling; the direct connection must exist.
  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?dflight - day ?darr - day)
    :precondition (and
      (has-location ?from ?dprev)
      (next ?dprev ?dflight)
      (next ?dflight ?darr)
      (direct ?from ?to)
      (free ?dflight)
      (free ?darr)
    )
    :effect (and
      ;; consume the travel day and the arrival day
      (not (free ?dflight))
      (not (free ?darr))
      (assigned ?dflight)
      (assigned ?darr)

      ;; mark travel day as in-transit and set arrival presence
      (in-transit ?dflight)
      (has-location ?to ?darr)
    )
  )
)
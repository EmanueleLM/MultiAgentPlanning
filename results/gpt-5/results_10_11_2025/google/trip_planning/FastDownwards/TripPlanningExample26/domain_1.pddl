(define (domain trip-planning-example26)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    ; time topology
    (next ?d1 - day ?d2 - day)
    (current ?d - day)

    ; per-day assignment
    (assigned ?d - day)
    (city-on-day ?c - city ?d - day)

    ; flight graph
    (direct-flight ?from - city ?to - city)

    ; exact city-day counts via consumable tokens
    (token-for ?t - token ?c - city)
    (unused ?t - token)
    (used ?t - token)

    ; prevent revisiting a city after leaving it (enforce contiguous blocks)
    (city-closed ?c - city)
  )

  ; Assign the current day's city by consuming a token of that city
  (:action assign-current-day-city
    :parameters (?c - city ?d - day ?t - token)
    :precondition (and
      (current ?d)
      (not (assigned ?d))
      (token-for ?t ?c)
      (unused ?t)
      (not (city-closed ?c))
    )
    :effect (and
      (city-on-day ?c ?d)
      (assigned ?d)
      (used ?t)
      (not (unused ?t))
    )
  )

  ; While at day d1, assign the next day's city (d2) by consuming a token
  (:action assign-next-day-city
    :parameters (?c - city ?d1 - day ?d2 - day ?t - token)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (not (assigned ?d2))
      (token-for ?t ?c)
      (unused ?t)
      (not (city-closed ?c))
    )
    :effect (and
      (city-on-day ?c ?d2)
      (assigned ?d2)
      (used ?t)
      (not (unused ?t))
    )
  )

  ; Advance to the next day if the city does not change across the boundary
  (:action advance-same-city
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (city-on-day ?c ?d1)
      (city-on-day ?c ?d2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
    )
  )

  ; Advance to the next day if the city changes; requires a direct flight and closes the departed city
  (:action advance-with-flight
    :parameters (?c1 - city ?c2 - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (city-on-day ?c1 ?d1)
      (city-on-day ?c2 ?d2)
      (direct-flight ?c1 ?c2)
      (not (city-closed ?c1))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (city-closed ?c1)
    )
  )
)
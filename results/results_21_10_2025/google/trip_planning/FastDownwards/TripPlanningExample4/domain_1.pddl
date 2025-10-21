(define (domain travel-domain)
  ; Domain: travel-domain
  ; Purpose: model a 12-day itinerary with direct-flight-only transitions.
  ; Requirements: STRIPS, typing, negative preconditions
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    ; assigned ?d ?c  -- day ?d is assigned as a stay in city ?c
    (assigned ?d - day ?c - city)
    ; free ?d  -- day ?d still unassigned
    (free ?d - day)
    ; direct ?c1 ?c2 -- there is a direct flight (or same-city stay) from ?c1 to ?c2
    (direct ?c1 - city ?c2 - city)
    ; day-prev ?d1 ?d2 -- ?d1 is the day immediately before ?d2 (consecutive-day relation)
    (day-prev ?d1 - day ?d2 - day)
  )

  ; Assign a city to the next day given the previous day is assigned and a direct hop exists.
  ; This enforces that every move from day N to N+1 must be allowed by direct flights (or same-city).
  (:action assign-day
    :parameters (?prevd - day ?d - day ?prevc - city ?c - city)
    :precondition (and
      (day-prev ?prevd ?d)
      (assigned ?prevd ?prevc)
      (direct ?prevc ?c)
      (free ?d)
    )
    :effect (and
      (assigned ?d ?c)
      (not (free ?d))
    )
  )
)
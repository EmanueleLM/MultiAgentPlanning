(define (domain travel-domain)
  ; Domain: travel-domain
  ; Purpose: model a 12-day itinerary with direct-flight-only transitions.
  ; Notes on agents:
  ; - "traveler" responsibilities: request specific city occupancy per day (modeled via assign-day action).
  ; - "flights_manager" responsibilities: provide direct-flight connectivity (modeled via the predicate (direct ...)).
  ; The domain action uses the flights_manager connectivity facts to ensure only direct flights (including same-city stays)
  ; are allowed between consecutive days.
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    ; assigned ?d ?c  -- day ?d is assigned as a stay in city ?c
    (assigned ?d - day ?c - city)
    ; free ?d  -- day ?d still unassigned
    (free ?d - day)
    ; direct ?c1 ?c2 -- flights_manager: there is a direct flight from ?c1 to ?c2 (includes same-city as "direct")
    (direct ?c1 - city ?c2 - city)
    ; day-prev ?d1 ?d2 -- ?d1 is the day immediately before ?d2 (consecutive-day relation)
    (day-prev ?d1 - day ?d2 - day)
  )

  ; Action used by the traveler to assign a city to the next day.
  ; Preconditions:
  ;  - the previous day is already assigned to some city ?prevc
  ;  - the flights_manager reports a direct connection from ?prevc to ?c (this allows same-city stay and direct flights)
  ;  - the target day is free (not yet assigned)
  ; Effects:
  ;  - mark the target day assigned to city ?c
  ;  - mark the day no longer free
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
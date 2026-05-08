(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; traveler is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)    ; chronological order relation between days
    (occupied ?d - day)           ; day ?d has been assigned/used in the itinerary
    (direct ?from - city ?to - city) ; direct flight leg available from -> to
    (visited ?c - city)           ; city has been visited at least once
  )

  ;; Stay in the same city for the next day (advance one day while remaining in same city)
  (:action stay_city
    :parameters (?c - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?c ?dprev)
      (next ?dprev ?dnext)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?c ?dnext)
      (occupied ?dnext)
      (visited ?c)
    )
  )

  ;; Fly from one city to another in one day (requires a direct flight leg)
  (:action fly_between
    :parameters (?from - city ?to - city ?dprev - day ?dnext - day)
    :precondition (and
      (at ?from ?dprev)
      (next ?dprev ?dnext)
      (direct ?from ?to)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?to ?dnext)
      (occupied ?dnext)
      (visited ?to)
    )
  )
)
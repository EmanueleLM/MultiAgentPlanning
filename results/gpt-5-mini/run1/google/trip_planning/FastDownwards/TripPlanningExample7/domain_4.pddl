(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; traveler is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)       ; chronological order between days
    (occupied ?d - day)              ; day ?d has been assigned (trip day)
    (direct ?from - city ?to - city) ; direct flight leg available from -> to
    (visited ?c - city)              ; city has been visited at least once
  )

  ;; Stay in the same city from one day to the next.
  ;; Requires that the next day is chronologically after the current and not yet occupied.
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

  ;; Fly from one city to another overnight (takes one day).
  ;; Requires an explicit direct flight leg and that the arrival day is unoccupied.
  (:action fly_from_to
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
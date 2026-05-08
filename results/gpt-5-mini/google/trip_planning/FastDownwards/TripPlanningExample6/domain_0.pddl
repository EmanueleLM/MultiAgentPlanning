(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types traveler city day)

  (:predicates
    ;; ordered day relation to enforce contiguity
    (next ?d1 ?d2 - day)

    ;; location of a traveler on a given day
    (at ?p - traveler ?c - city ?d - day)

    ;; direct, single-leg (no connections) flight link between cities
    (direct ?from ?to - city)

    ;; flight available for a direct link when departing on a particular day
    ;; (flight-available ?from ?to ?day) means a direct flight can be taken
    ;; departing on ?day and arriving the same or next day as modeled by actions
    (flight-available ?from ?to - city ?d - day)
  )

  ;; Traveler moves from one day to the next either by taking a direct flight
  ;; that is available the departure day, or by staying in the same city.
  ;; Both actions require contiguity (a next relation between days) so the
  ;; planner cannot reorder day-to-day transitions.
  (:action fly-next-day
    :parameters (?p - traveler ?from ?to - city ?d1 ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (flight-available ?from ?to ?d1)
    )
    :effect (and
      ;; establish location on the next day at the destination city
      (at ?p ?to ?d2)
    )
  )

  (:action stay-next-day
    :parameters (?p - traveler ?c - city ?d1 ?d2 - day)
    :precondition (and
      (at ?p ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      ;; remain in the same city on the next day
      (at ?p ?c ?d2)
    )
  )
)
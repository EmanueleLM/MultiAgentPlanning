(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types traveler city day)

  (:predicates
    ;; ordered day relation to enforce contiguity
    (next ?d1 ?d2 - day)

    ;; location of a traveler on a given day
    (at ?p - traveler ?c - city ?d - day)

    ;; direct, single-leg flight link between cities (given flight graph)
    (direct ?from ?to - city)

    ;; flight availability for a direct link when departing on a particular day
    (flight-available ?from ?to - city ?d - day)
  )

  ;; Take a direct flight on departure day ?d1 and arrive on the next day ?d2
  (:action fly-next-day
    :parameters (?p - traveler ?from ?to - city ?d1 ?d2 - day)
    :precondition (and
      (at ?p ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (flight-available ?from ?to ?d1)
    )
    :effect (and
      (at ?p ?to ?d2)
    )
  )

  ;; Stay in the same city for the next day
  (:action stay-next-day
    :parameters (?p - traveler ?c - city ?d1 ?d2 - day)
    :precondition (and
      (at ?p ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (at ?p ?c ?d2)
    )
  )
)
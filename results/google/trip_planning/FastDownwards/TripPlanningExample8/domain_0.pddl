(define (domain itinerary)
  (:requirements :typing :fluents :negative-preconditions :strips)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (unassigned ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )
  (:functions
    (krakow-days) ; total assigned Krakow days
    (zurich-days) ; total assigned Zurich days
    (athens-days) ; total assigned Athens days
    (total-flights) ; used for metric
  )

  ;; Stay in the same city for the next consecutive day
  (:action assign-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (unassigned ?d2))
    :effect (and
      (not (unassigned ?d2))
      (at ?c ?d2)
      (when (and) (increase (total-flights) 0)) ; no flight cost
      (when (and (or (eq ?c athens) (eq ?c krakow) (eq ?c zurich)))
        (and
          (when (eq ?c krakow) (increase (krakow-days) 1))
          (when (eq ?c zurich) (increase (zurich-days) 1))
          (when (eq ?c athens) (increase (athens-days) 1))
        )
      )
    )
  )

  ;; Fly from one city to another for the next consecutive day (only allowed where flight predicate true)
  (:action assign-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (unassigned ?d2) (flight ?from ?to))
    :effect (and
      (not (unassigned ?d2))
      (at ?to ?d2)
      (increase (total-flights) 1)
      (when (and (or (eq ?to athens) (eq ?to krakow) (eq ?to zurich)))
        (and
          (when (eq ?to krakow) (increase (krakow-days) 1))
          (when (eq ?to zurich) (increase (zurich-days) 1))
          (when (eq ?to athens) (increase (athens-days) 1))
        )
      )
    )
  )
)
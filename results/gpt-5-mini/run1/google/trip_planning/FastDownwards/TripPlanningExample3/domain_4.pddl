(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (is_day ?d - day)
    (day_next ?d1 ?d2 - day)         ; ?d2 is the day after ?d1
    (in ?c - city ?d - day)          ; traveler is located in city ?c for full day ?d
    (assigned ?d - day)              ; that day's location has been fixed (prevents double-assignment)
    (direct ?from - city ?to - city) ; allowed direct flight hops (directed)
  )

  ;; Stay in the same city for the next day
  (:action traveler_stay
    :parameters (?c - city ?d ?d2 - day)
    :precondition (and
      (in ?c ?d)
      (day_next ?d ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in ?c ?d2)
    )
  )

  ;; Fly from one city to a directly connected city between consecutive days
  (:action traveler_fly
    :parameters (?from - city ?to - city ?d ?d2 - day)
    :precondition (and
      (in ?from ?d)
      (direct ?from ?to)
      (day_next ?d ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in ?to ?d2)
    )
  )
)
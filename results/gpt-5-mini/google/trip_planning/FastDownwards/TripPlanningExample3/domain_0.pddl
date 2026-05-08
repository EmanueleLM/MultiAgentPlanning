(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (day ?d - day)
    (day-succ ?d1 ?d2 - day)         ; successor relation: ?d2 is the day after ?d1
    (city ?c - city)
    (in ?c - city ?d - day)          ; traveler is located in city ?c for full day ?d
    (assigned ?d - day)              ; some action has fixed the location for day ?d
    (direct ?from - city ?to - city) ; allowed direct flight hops (undirected edges modeled by two directions)
  )

  ; Stay in the same city for the next day (travel occurs between whole days)
  (:action traveler_stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (in ?c ?d)
      (day-succ ?d ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in ?c ?d2)
    )
  )

  ; Fly from one city to another so that the arrival city is the next day's full-day location.
  (:action traveler_fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (in ?from ?d)
      (direct ?from ?to)
      (day-succ ?d ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (in ?to ?d2)
    )
  )
)
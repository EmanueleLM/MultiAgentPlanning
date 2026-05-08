(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (day ?d - day)
    (day-succ ?d1 ?d2 - day)         ; ?d2 is the day after ?d1
    (in ?c - city ?d - day)          ; traveler is located in city ?c for full day ?d
    (assigned ?d - day)              ; that day's location has been fixed
    (direct ?from - city ?to - city) ; allowed direct flight hops (modeled as directed edges)
  )

  ; Stay in the same city from day ?d to the next day ?d2
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

  ; Fly from ?from on day ?d and arrive in ?to for full day ?d2
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
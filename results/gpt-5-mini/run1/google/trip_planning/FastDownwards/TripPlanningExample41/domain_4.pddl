(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)          ;; traveler is in city on a specific day
    (next_day ?d1 - day ?d2 - day)  ;; temporal ordering of days
    (flight ?from - city ?to - city) ;; direct flight connectivity
    (day_assigned ?d - day)         ;; a day has been assigned to some city (uniqueness)
  )

  ;; stay in same city on the next day
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (not (day_assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (day_assigned ?d2)
    )
  )

  ;; fly from one city to another on the next day (requires a direct flight)
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (flight ?from ?to)
      (not (day_assigned ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (day_assigned ?d2)
    )
  )
)
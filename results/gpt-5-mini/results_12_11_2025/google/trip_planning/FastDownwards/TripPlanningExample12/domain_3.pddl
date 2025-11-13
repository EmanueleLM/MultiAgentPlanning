(define (domain trip-planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (direct ?c1 - city ?c2 - city)
    (succ ?d1 - day ?d2 - day)
    (current ?d - day)
    (assigned ?d - day ?c - city)
    (unassigned ?d - day)
    (window-day ?d - day)
    (tallinn-window)
  )

  ;; remain in the same city and advance one day (assign next day same city)
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (assigned ?d1 ?c)
      (succ ?d1 ?d2)
      (unassigned ?d2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (assigned ?d2 ?c)
      (not (unassigned ?d2))
    )
  )

  ;; fly between two directly connected cities at a day boundary (assign next day the destination)
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (assigned ?d1 ?from)
      (direct ?from ?to)
      (succ ?d1 ?d2)
      (unassigned ?d2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (assigned ?d2 ?to)
      (not (unassigned ?d2))
    )
  )

  ;; record that at least one tallinn day falls within the required window
  (:action mark-tallinn-window
    :parameters (?d - day)
    :precondition (and
      (assigned ?d tallinn)
      (window-day ?d)
    )
    :effect (tallinn-window)
  )
)
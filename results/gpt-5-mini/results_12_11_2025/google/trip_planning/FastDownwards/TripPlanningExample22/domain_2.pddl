(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (current ?d - day)
    (first ?d - day)
    (next ?d1 - day ?d2 - day)

    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)

    (flight ?from - city ?to - city)
  )

  ;; Assign the first day to any city (no flight constraint for day1).
  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (first ?d) (unassigned ?d))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  ;; Stay in the same city as previous day.
  (:action assign_stay
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?c) (unassigned ?d))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  ;; Move to a different city from previous day; requires a direct flight from previous day's city.
  (:action assign_move
    :parameters (?prev - day ?d - day ?cold - city ?cnew - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?cold) (flight ?cold ?cnew) (unassigned ?d))
    :effect (and
      (assigned ?d ?cnew)
      (visited ?cnew)
      (not (unassigned ?d))
    )
  )

  ;; Advance current day pointer; only allowed after the current day has been assigned.
  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?nxt)
    )
  )
)
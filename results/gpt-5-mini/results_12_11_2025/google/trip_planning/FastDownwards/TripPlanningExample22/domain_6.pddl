(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (is_first ?d - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
  )

  ;; Assign a city to the very first day (no prior-day flight constraint)
  (:action assign_start
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (is_first ?d) (unassigned ?d))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  ;; Stay in the same city as the previous day
  (:action assign_stay
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?c) (unassigned ?d))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  ;; Move between cities using a direct flight from previous day's city
  (:action assign_move
    :parameters (?prev - day ?d - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?prev ?d)
      (assigned ?prev ?from)
      (flight ?from ?to)
      (unassigned ?d)
    )
    :effect (and
      (assigned ?d ?to)
      (visited ?to)
      (not (unassigned ?d))
    )
  )

  ;; Advance the current-day pointer; only allowed after current day is assigned
  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?nxt)
    )
  )
)
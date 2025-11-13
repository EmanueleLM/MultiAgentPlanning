(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    ;; temporal pointer and ordering
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (is_first ?d - day)

    ;; assignment bookkeeping (each day must be assigned exactly once)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)

    ;; city visitation and one-contiguous-block enforcement
    (visited ?c - city)
    (left ?c - city)

    ;; flight connectivity (only direct flights may be used for city changes)
    (flight ?from - city ?to - city)

    ;; optional time-window marker (Berlin show days; treated as data only here)
    (show_day ?d - day)
  )

  ;; Assign city for the first day (no previous-day flight constraint).
  ;; Disallow assigning a city that has already been left (prevents re-entering a city).
  (:action assign_start
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (is_first ?d) (unassigned ?d) (not (left ?c)))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  ;; Stay in the same city as the previous day (contiguous occupancy).
  ;; Requires the previous day to be assigned to the same city and that the city has not been left.
  (:action assign_stay
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?c) (unassigned ?d) (not (left ?c)))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  ;; Move between cities using a direct flight from the previous day's city.
  ;; Sets the previous city as left, preventing any future re-entry to that city (enforces contiguous block per city).
  (:action assign_move
    :parameters (?prev - day ?d - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?prev ?d)
      (assigned ?prev ?from)
      (flight ?from ?to)
      (unassigned ?d)
      (not (left ?to))
    )
    :effect (and
      (assigned ?d ?to)
      (visited ?to)
      (not (unassigned ?d))
      (left ?from)
    )
  )

  ;; Advance the current-day pointer to the successor day (only after the current day is assigned).
  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?nxt)
    )
  )
)
(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (visited ?c - city)
    (unassigned ?d - day)
    (workshop-day ?d - day)
    (workshop-city ?c - city)
  )

  ;; Assign the first day to a non-workshop city
  (:action assign-first-general
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (unassigned ?d)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (visited ?c)
    )
  )

  ;; Assign the first day to a workshop city (must be a workshop-city)
  (:action assign-first-workshop
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (unassigned ?d)
      (workshop-day ?d)
      (workshop-city ?c)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (visited ?c)
    )
  )

  ;; Stay in the same city from one non-workshop day to the next non-workshop day
  (:action stay-general
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (unassigned ?d2)
      (not (workshop-day ?d2))
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?c)
      (visited ?c)
    )
  )

  ;; Stay in a workshop city across consecutive workshop days or enter the first workshop day from the prior day
  (:action stay-workshop
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (unassigned ?d2)
      (workshop-day ?d2)
      (workshop-city ?c)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?c)
      (visited ?c)
    )
  )

  ;; Fly between non-workshop days (both departure and arrival must be non-workshop days)
  (:action fly-general
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (unassigned ?d2)
      (direct ?from ?to)
      (not (workshop-day ?d1))
      (not (workshop-day ?d2))
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?to)
      (visited ?to)
    )
  )

  ;; Fly into the first workshop day (arrival must be a workshop-city and arrival day a workshop-day;
  ;; departure day must not be a workshop-day to preserve contiguous workshop occupancy)
  (:action fly-to-workshop
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (unassigned ?d2)
      (direct ?from ?to)
      (workshop-day ?d2)
      (workshop-city ?to)
      (not (workshop-day ?d1))
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?to)
      (visited ?to)
    )
  )
)
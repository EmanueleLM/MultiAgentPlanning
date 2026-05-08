(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (free_day ?d - day)
    (flight ?from - city ?to - city)

    (slot_belongs ?s - slot ?c - city)
    (slot_unassigned ?s - slot)
    (slot_assigned ?s - slot ?d - day)
  )

  ;; stay in the same city from one day to the next and consume a slot of that city
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (free_day ?d2)
      (slot_belongs ?s ?c)
      (slot_unassigned ?s)
    )
    :effect (and
      (at ?c ?d2)
      (slot_assigned ?s ?d2)
      (not (slot_unassigned ?s))
      (not (free_day ?d2))
    )
  )

  ;; fly from one city to another on consecutive days and consume a slot of the destination city
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?s - slot)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (flight ?from ?to)
      (free_day ?d2)
      (slot_belongs ?s ?to)
      (slot_unassigned ?s)
    )
    :effect (and
      (at ?to ?d2)
      (slot_assigned ?s ?d2)
      (not (slot_unassigned ?s))
      (not (free_day ?d2))
    )
  )
)
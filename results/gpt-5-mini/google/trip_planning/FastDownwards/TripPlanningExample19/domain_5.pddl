(define (domain trip-planning)
  (:requirements :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (assigned ?d - day ?c - city)
    (day-unassigned ?d - day)
    (first-day ?d - day)
    (next ?d1 - day ?d2 - day)

    (slot-unused ?s - slot)
    (slot-belongs ?s - slot ?c - city)

    (allowed-flight ?from - city ?to - city)

    (meeting-day ?d - day)
    (is-meeting-city ?c - city)
    (meeting-held)
  )

  (:action assign-first-day
    :parameters (?d - day ?c - city ?s - slot)
    :precondition (and (first-day ?d) (day-unassigned ?d) (slot-unused ?s) (slot-belongs ?s ?c))
    :effect (and (assigned ?d ?c) (not (day-unassigned ?d)) (not (slot-unused ?s)))
  )

  (:action assign-next-stay
    :parameters (?prevd - day ?d - day ?c - city ?s - slot)
    :precondition (and (next ?prevd ?d) (assigned ?prevd ?c) (day-unassigned ?d) (slot-unused ?s) (slot-belongs ?s ?c))
    :effect (and (assigned ?d ?c) (not (day-unassigned ?d)) (not (slot-unused ?s)))
  )

  (:action assign-next-travel
    :parameters (?prevd - day ?d - day ?prevc - city ?c - city ?s - slot)
    :precondition (and (next ?prevd ?d) (assigned ?prevd ?prevc) (allowed-flight ?prevc ?c) (day-unassigned ?d) (slot-unused ?s) (slot-belongs ?s ?c))
    :effect (and (assigned ?d ?c) (not (day-unassigned ?d)) (not (slot-unused ?s)))
  )

  (:action declare-meeting
    :parameters (?d - day ?c - city)
    :precondition (and (meeting-day ?d) (assigned ?d ?c) (is-meeting-city ?c))
    :effect (and (meeting-held))
  )
)
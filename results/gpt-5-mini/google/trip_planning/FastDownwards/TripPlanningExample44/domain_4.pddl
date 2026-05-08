(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (day_is_first ?d - day)
    (flight ?c_from - city ?c_to - city)
    (slot_for_city ?s - slot ?c - city)
    (wedding_day_window ?d - day)
    (slot_assigned ?s - slot ?d - day)
    (slot_filled ?s - slot)
    (at ?c - city ?d - day)
    (day_assigned ?d - day)
    (wedding_attended)
  )

  (:action assign_first_day
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and
      (slot_for_city ?s ?c)
      (day_is_first ?d)
      (not (slot_filled ?s))
      (not (day_assigned ?d))
    )
    :effect (and
      (slot_assigned ?s ?d)
      (slot_filled ?s)
      (day_assigned ?d)
      (at ?c ?d)
    )
  )

  (:action assign_next_day_same_city
    :parameters (?s - slot ?c - city ?d_prev - day ?d_next - day)
    :precondition (and
      (slot_for_city ?s ?c)
      (next_day ?d_prev ?d_next)
      (at ?c ?d_prev)
      (not (slot_filled ?s))
      (not (day_assigned ?d_next))
    )
    :effect (and
      (slot_assigned ?s ?d_next)
      (slot_filled ?s)
      (day_assigned ?d_next)
      (at ?c ?d_next)
    )
  )

  (:action assign_next_day_flight
    :parameters (?s - slot ?c_from - city ?c_to - city ?d_prev - day ?d_next - day)
    :precondition (and
      (slot_for_city ?s ?c_to)
      (next_day ?d_prev ?d_next)
      (at ?c_from ?d_prev)
      (flight ?c_from ?c_to)
      (not (slot_filled ?s))
      (not (day_assigned ?d_next))
    )
    :effect (and
      (slot_assigned ?s ?d_next)
      (slot_filled ?s)
      (day_assigned ?d_next)
      (at ?c_to ?d_next)
    )
  )

  (:action attend_wedding
    :parameters (?s - slot ?d - day)
    :precondition (and
      (slot_for_city ?s zurich)
      (slot_assigned ?s ?d)
      (wedding_day_window ?d)
      (not (wedding_attended))
    )
    :effect (and
      (wedding_attended)
    )
  )
)
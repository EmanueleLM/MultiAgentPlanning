(define (domain jackofalltrades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (day_is_first ?d - day)
    (flight ?c_from - city ?c_to - city)
    (slot_for_city ?s - slot ?c - city)
    (wedding_day_window ?d - day)
    (filled ?s - slot ?d - day)
    (slot_filled ?s - slot)
    (at ?c - city ?d - day)
    (day_assigned ?d - day)
    (wedding_attended)
  )

  (:action fill_first_day_for_city
    :parameters (?s - slot ?c - city ?d - day)
    :precondition (and
      (slot_for_city ?s ?c)
      (day_is_first ?d)
      (not (slot_filled ?s))
      (not (day_assigned ?d))
    )
    :effect (and
      (filled ?s ?d)
      (slot_filled ?s)
      (day_assigned ?d)
      (at ?c ?d)
    )
  )

  (:action fill_next_day_stay
    :parameters (?s_next - slot ?c - city ?d_prev - day ?d_next - day)
    :precondition (and
      (slot_for_city ?s_next ?c)
      (next_day ?d_prev ?d_next)
      (at ?c ?d_prev)
      (not (slot_filled ?s_next))
      (not (day_assigned ?d_next))
    )
    :effect (and
      (filled ?s_next ?d_next)
      (slot_filled ?s_next)
      (day_assigned ?d_next)
      (at ?c ?d_next)
    )
  )

  (:action fill_next_day_move
    :parameters (?s_next - slot ?c_from - city ?c_to - city ?d_prev - day ?d_next - day)
    :precondition (and
      (slot_for_city ?s_next ?c_to)
      (next_day ?d_prev ?d_next)
      (at ?c_from ?d_prev)
      (flight ?c_from ?c_to)
      (not (slot_filled ?s_next))
      (not (day_assigned ?d_next))
    )
    :effect (and
      (filled ?s_next ?d_next)
      (slot_filled ?s_next)
      (day_assigned ?d_next)
      (at ?c_to ?d_next)
    )
  )

  (:action mark_wedding_attended
    :parameters (?s - slot ?d - day)
    :precondition (and
      (slot_for_city ?s zurich)
      (filled ?s ?d)
      (wedding_day_window ?d)
      (not (wedding_attended))
      ;; This action is intended to be applicable only for the designated wedding slot.
      ;; The problem encodes that designation by having slot_for_city facts and by
      ;; the goal requiring wedding_attended after the designated slot is filled in-window.
    )
    :effect (and
      (wedding_attended)
    )
  )
)
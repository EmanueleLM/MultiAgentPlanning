(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (day_is_first ?d - day)
    (flight ?c_from - city ?c_to - city)
    (slot_for_city ?s - slot ?c - city)
    (wedding_day_window ?d - day)
    (slot_assigned ?s - slot ?d - day)        ;; slot s is assigned to day d
    (slot_filled ?s - slot)                   ;; slot has been assigned to some day
    (at ?c - city ?d - day)                   ;; on day d you are in city c
    (day_assigned ?d - day)                   ;; day d has been used/assigned
    (wedding_attended)                        ;; wedding in zurich attended
  )

  ;; assign a slot to the first day (establish starting city on day1)
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

  ;; assign a slot to the next day when staying in the same city
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

  ;; assign a slot to the next day when flying from c_from to c_to
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

  ;; mark the wedding as attended: requires that the designated zurich slot has been assigned to a day in the wedding window
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
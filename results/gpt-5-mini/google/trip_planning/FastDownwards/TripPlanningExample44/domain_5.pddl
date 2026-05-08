(define (domain trip_planning_compact)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (day_is_first ?d - day)
    (flight ?c1 - city ?c2 - city)

    ;; slot represents a required night in a specific city (captures desired counts)
    (slot_for_city ?s - slot ?c - city)
    (slot_filled ?s - slot)

    ;; assignment of a concrete day to a city
    (day_assigned ?d - day)
    (day_in_city ?d - day ?c - city)

    ;; wedding attendance bookkeeping
    (wedding_day_window ?d - day)
    (wedding_attended)
  )

  ;; assign a first-day slot to the first day (no travel constraint)
  (:action assign_first_day
    :parameters (?s - slot ?d - day ?c - city)
    :precondition (and
      (slot_for_city ?s ?c)
      (day_is_first ?d)
      (not (slot_filled ?s))
      (not (day_assigned ?d))
    )
    :effect (and
      (slot_filled ?s)
      (day_assigned ?d)
      (day_in_city ?d ?c)
    )
  )

  ;; stay in the same city for next day: copy city from previous day
  (:action assign_next_day_stay
    :parameters (?s - slot ?d_prev - day ?d - day ?c - city)
    :precondition (and
      (slot_for_city ?s ?c)
      (next_day ?d_prev ?d)
      (day_in_city ?d_prev ?c)
      (not (slot_filled ?s))
      (not (day_assigned ?d))
    )
    :effect (and
      (slot_filled ?s)
      (day_assigned ?d)
      (day_in_city ?d ?c)
    )
  )

  ;; fly from previous day's city to this city's assignment
  (:action assign_next_day_flight
    :parameters (?s - slot ?d_prev - day ?d - day ?c_prev - city ?c - city)
    :precondition (and
      (slot_for_city ?s ?c)
      (next_day ?d_prev ?d)
      (day_in_city ?d_prev ?c_prev)
      (flight ?c_prev ?c)
      (not (slot_filled ?s))
      (not (day_assigned ?d))
    )
    :effect (and
      (slot_filled ?s)
      (day_assigned ?d)
      (day_in_city ?d ?c)
    )
  )

  ;; attend the wedding on a Zurich day within the allowed window
  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (day_in_city ?d zurich)
      (wedding_day_window ?d)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )
)
(define (domain european_trip_17_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day visit_slot
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (occupied ?d - day ?c - city)

    (slot_for_city ?s - visit_slot ?c - city)
    (slot_unused ?s - visit_slot)
    (day_counted ?d - day)
    (uses_slot ?d - day ?s - visit_slot)

    (wedding_window_day ?d - day)
    (wedding_attended)

    (start_pending)
  )

  (:action assign_initial_day
    :parameters (?c - city ?s - visit_slot)
    :precondition (and
      (start_pending)
      (current_day day_1)
      (not (day_counted day_1))
      (slot_unused ?s)
      (slot_for_city ?s ?c)
    )
    :effect (and
      (not (start_pending))
      (at ?c)
      (occupied day_1 ?c)
      (day_counted day_1)
      (uses_slot day_1 ?s)
      (not (slot_unused ?s))
    )
  )

  (:action advance_stay
    :parameters (?d1 - day ?d2 - day ?c - city ?s - visit_slot)
    :precondition (and
      (not (start_pending))
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (day_counted ?d1)
      (not (day_counted ?d2))
      (slot_unused ?s)
      (slot_for_city ?s ?c)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2 ?c)
      (day_counted ?d2)
      (uses_slot ?d2 ?s)
      (not (slot_unused ?s))
    )
  )

  (:action advance_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?s - visit_slot)
    :precondition (and
      (not (start_pending))
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (day_counted ?d1)
      (not (day_counted ?d2))
      (slot_unused ?s)
      (slot_for_city ?s ?to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (occupied ?d2 ?to)
      (day_counted ?d2)
      (uses_slot ?d2 ?s)
      (not (slot_unused ?s))
    )
  )

  (:action mark_wedding_attended
    :parameters (?d - day)
    :precondition (and
      (occupied ?d zurich)
      (wedding_window_day ?d)
      (not (wedding_attended))
    )
    :effect (and
      (wedding_attended)
    )
  )
)
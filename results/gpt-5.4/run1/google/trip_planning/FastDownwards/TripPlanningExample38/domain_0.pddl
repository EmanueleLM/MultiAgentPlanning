(define (domain european_trip_5_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day slot
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (assigned ?d - day)
    (in_city ?d - day ?c - city)
    (last_assigned_day ?d - day)
    (slot_for_city ?s - slot ?c - city)
    (slot_unused ?s - slot)
    (slot_used ?s - slot)
  )

  (:action assign_first_day
    :parameters (?c - city ?s - slot)
    :precondition (and
      (not (assigned day1))
      (slot_for_city ?s ?c)
      (slot_unused ?s)
    )
    :effect (and
      (assigned day1)
      (in_city day1 ?c)
      (not (slot_unused ?s))
      (slot_used ?s)
      (last_assigned_day day1)
    )
  )

  (:action assign_next_day_stay
    :parameters (?d_prev - day ?d_next - day ?c - city ?s - slot)
    :precondition (and
      (last_assigned_day ?d_prev)
      (next_day ?d_prev ?d_next)
      (not (assigned ?d_next))
      (in_city ?d_prev ?c)
      (slot_for_city ?s ?c)
      (slot_unused ?s)
    )
    :effect (and
      (assigned ?d_next)
      (in_city ?d_next ?c)
      (not (slot_unused ?s))
      (slot_used ?s)
      (not (last_assigned_day ?d_prev))
      (last_assigned_day ?d_next)
    )
  )

  (:action assign_next_day_fly
    :parameters (?d_prev - day ?d_next - day ?from - city ?to - city ?s - slot)
    :precondition (and
      (last_assigned_day ?d_prev)
      (next_day ?d_prev ?d_next)
      (not (assigned ?d_next))
      (in_city ?d_prev ?from)
      (direct_flight ?from ?to)
      (not (in_city ?d_prev ?to))
      (slot_for_city ?s ?to)
      (slot_unused ?s)
    )
    :effect (and
      (assigned ?d_next)
      (in_city ?d_next ?to)
      (not (slot_unused ?s))
      (slot_used ?s)
      (not (last_assigned_day ?d_prev))
      (last_assigned_day ?d_next)
    )
  )
)
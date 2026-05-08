(define (domain european_trip_15_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    stage
    stay_slot
  )

  (:predicates
    (at ?c - city)
    (current ?s - stage)
    (next_stage ?from - stage ?to - stage)
    (direct ?from - city ?to - city)
    (same_city ?c - city)
    (slot_for_city ?slot - stay_slot ?c - city)
    (slot_unused ?slot - stay_slot)
    (slot_used ?slot - stay_slot)
    (day_assigned ?s - stage)
    (visited_on_day ?s - stage ?c - city)
    (start_chosen)
  )

  (:action choose_start_city
    :parameters (?c - city)
    :precondition (and
      (current d0)
      (not (start_chosen))
    )
    :effect (and
      (at ?c)
      (start_chosen)
    )
  )

  (:action advance_stay_same_city
    :parameters (?from_stage - stage ?to_stage - stage ?city - city ?slot - stay_slot)
    :precondition (and
      (start_chosen)
      (current ?from_stage)
      (next_stage ?from_stage ?to_stage)
      (at ?city)
      (same_city ?city)
      (slot_unused ?slot)
      (slot_for_city ?slot ?city)
      (not (day_assigned ?to_stage))
    )
    :effect (and
      (not (current ?from_stage))
      (current ?to_stage)
      (not (slot_unused ?slot))
      (slot_used ?slot)
      (day_assigned ?to_stage)
      (visited_on_day ?to_stage ?city)
    )
  )

  (:action advance_fly_direct
    :parameters (?from_stage - stage ?to_stage - stage ?from_city - city ?to_city - city ?slot - stay_slot)
    :precondition (and
      (start_chosen)
      (current ?from_stage)
      (next_stage ?from_stage ?to_stage)
      (at ?from_city)
      (direct ?from_city ?to_city)
      (slot_unused ?slot)
      (slot_for_city ?slot ?to_city)
      (not (day_assigned ?to_stage))
    )
    :effect (and
      (not (current ?from_stage))
      (current ?to_stage)
      (not (at ?from_city))
      (at ?to_city)
      (not (slot_unused ?slot))
      (slot_used ?slot)
      (day_assigned ?to_stage)
      (visited_on_day ?to_stage ?to_city)
    )
  )
)
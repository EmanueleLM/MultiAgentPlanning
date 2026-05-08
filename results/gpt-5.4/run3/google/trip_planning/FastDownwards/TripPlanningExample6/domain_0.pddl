(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct ?from - city ?to - city)
    (day_counted ?d - day)
    (requires_berlin ?d - day)

    (berlin_slot_1_used)
    (berlin_slot_2_used)
    (berlin_slot_3_used)
    (berlin_slot_4_used)

    (munich_slot_1_used)
    (munich_slot_2_used)
    (munich_slot_3_used)

    (dubrovnik_slot_1_used)
    (dubrovnik_slot_2_used)
    (dubrovnik_slot_3_used)
  )

  (:action count_day_in_berlin_slot_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at berlin)
      (not (day_counted ?d))
      (not (berlin_slot_1_used))
    )
    :effect (and
      (day_counted ?d)
      (berlin_slot_1_used)
    )
  )

  (:action count_day_in_berlin_slot_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at berlin)
      (not (day_counted ?d))
      (not (berlin_slot_2_used))
    )
    :effect (and
      (day_counted ?d)
      (berlin_slot_2_used)
    )
  )

  (:action count_day_in_berlin_slot_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at berlin)
      (not (day_counted ?d))
      (not (berlin_slot_3_used))
    )
    :effect (and
      (day_counted ?d)
      (berlin_slot_3_used)
    )
  )

  (:action count_day_in_berlin_slot_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at berlin)
      (not (day_counted ?d))
      (not (berlin_slot_4_used))
    )
    :effect (and
      (day_counted ?d)
      (berlin_slot_4_used)
    )
  )

  (:action count_day_in_munich_slot_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at munich)
      (not (day_counted ?d))
      (not (munich_slot_1_used))
    )
    :effect (and
      (day_counted ?d)
      (munich_slot_1_used)
    )
  )

  (:action count_day_in_munich_slot_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at munich)
      (not (day_counted ?d))
      (not (munich_slot_2_used))
    )
    :effect (and
      (day_counted ?d)
      (munich_slot_2_used)
    )
  )

  (:action count_day_in_munich_slot_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at munich)
      (not (day_counted ?d))
      (not (munich_slot_3_used))
    )
    :effect (and
      (day_counted ?d)
      (munich_slot_3_used)
    )
  )

  (:action count_day_in_dubrovnik_slot_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at dubrovnik)
      (not (day_counted ?d))
      (not (dubrovnik_slot_1_used))
    )
    :effect (and
      (day_counted ?d)
      (dubrovnik_slot_1_used)
    )
  )

  (:action count_day_in_dubrovnik_slot_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at dubrovnik)
      (not (day_counted ?d))
      (not (dubrovnik_slot_2_used))
    )
    :effect (and
      (day_counted ?d)
      (dubrovnik_slot_2_used)
    )
  )

  (:action count_day_in_dubrovnik_slot_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at dubrovnik)
      (not (day_counted ?d))
      (not (dubrovnik_slot_3_used))
    )
    :effect (and
      (day_counted ?d)
      (dubrovnik_slot_3_used)
    )
  )

  (:action advance_stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (day_counted ?d1)
      (not (requires_berlin ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action advance_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (day_counted ?d1)
      (not (requires_berlin ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action advance_to_required_berlin_day_stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (requires_berlin ?d2)
      (at berlin)
      (day_counted ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action advance_to_required_berlin_day_fly
    :parameters (?d1 - day ?d2 - day ?from - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (requires_berlin ?d2)
      (at ?from)
      (direct ?from berlin)
      (day_counted ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at berlin)
    )
  )
)
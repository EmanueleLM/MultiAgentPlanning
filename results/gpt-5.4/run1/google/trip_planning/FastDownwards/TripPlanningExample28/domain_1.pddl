(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    venice florence zurich - city
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)
    (trip_done)
    (direct ?from - city ?to - city)
    (at_city ?c - city)
    (assigned ?d - day ?c - city)
    (venice_count_0)
    (venice_count_1)
    (venice_count_2)
    (venice_count_3)
    (venice_count_4)
    (venice_count_5)
    (venice_count_6)
    (florence_count_0)
    (florence_count_1)
    (florence_count_2)
    (florence_count_3)
    (florence_count_4)
    (florence_count_5)
    (florence_count_6)
    (zurich_count_0)
    (zurich_count_1)
    (zurich_count_2)
  )

  (:action assign_first_day_venice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (trip_done))
      (not (at_city venice))
      (not (at_city florence))
      (not (at_city zurich))
      (venice_count_0)
    )
    :effect (and
      (assigned ?d venice)
      (at_city venice)
      (not (venice_count_0))
      (venice_count_1)
      (not (current_day ?d))
    )
  )

  (:action assign_first_day_florence
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (trip_done))
      (not (at_city venice))
      (not (at_city florence))
      (not (at_city zurich))
      (florence_count_0)
    )
    :effect (and
      (assigned ?d florence)
      (at_city florence)
      (not (florence_count_0))
      (florence_count_1)
      (not (current_day ?d))
    )
  )

  (:action assign_first_day_zurich
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (trip_done))
      (not (at_city venice))
      (not (at_city florence))
      (not (at_city zurich))
      (zurich_count_0)
    )
    :effect (and
      (assigned ?d zurich)
      (at_city zurich)
      (not (zurich_count_0))
      (zurich_count_1)
      (not (current_day ?d))
    )
  )

  (:action advance_after_venice_day
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (assigned ?d venice)
      (next_day ?d ?d2)
      (not (current_day ?d2))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action advance_after_florence_day
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (assigned ?d florence)
      (next_day ?d ?d2)
      (not (current_day ?d2))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action advance_after_zurich_day
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (assigned ?d zurich)
      (next_day ?d ?d2)
      (not (current_day ?d2))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action finish_after_venice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (assigned ?d venice)
      (last_day ?d)
      (not (trip_done))
    )
    :effect (and
      (trip_done)
    )
  )

  (:action finish_after_florence
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (assigned ?d florence)
      (last_day ?d)
      (not (trip_done))
    )
    :effect (and
      (trip_done)
    )
  )

  (:action finish_after_zurich
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (assigned ?d zurich)
      (last_day ?d)
      (not (trip_done))
    )
    :effect (and
      (trip_done)
    )
  )

  (:action assign_stay_venice_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (venice_count_1)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (venice_count_1))
      (venice_count_2)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_venice_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (venice_count_2)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (venice_count_2))
      (venice_count_3)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_venice_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (venice_count_3)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (venice_count_3))
      (venice_count_4)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_venice_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (venice_count_4)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (venice_count_4))
      (venice_count_5)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_venice_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (venice_count_5)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (venice_count_5))
      (venice_count_6)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_florence_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city florence)
      (florence_count_1)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (florence_count_1))
      (florence_count_2)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_florence_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city florence)
      (florence_count_2)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (florence_count_2))
      (florence_count_3)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_florence_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city florence)
      (florence_count_3)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (florence_count_3))
      (florence_count_4)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_florence_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city florence)
      (florence_count_4)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (florence_count_4))
      (florence_count_5)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_florence_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city florence)
      (florence_count_5)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (florence_count_5))
      (florence_count_6)
      (not (current_day ?d))
    )
  )

  (:action assign_stay_zurich_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (zurich_count_1)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d zurich)
      (not (zurich_count_1))
      (zurich_count_2)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_venice_to_zurich_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (direct venice zurich)
      (zurich_count_0)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d zurich)
      (not (at_city venice))
      (at_city zurich)
      (not (zurich_count_0))
      (zurich_count_1)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_venice_to_zurich_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city venice)
      (direct venice zurich)
      (zurich_count_1)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d zurich)
      (not (at_city venice))
      (at_city zurich)
      (not (zurich_count_1))
      (zurich_count_2)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_venice_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich venice)
      (venice_count_0)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (at_city zurich))
      (at_city venice)
      (not (venice_count_0))
      (venice_count_1)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_venice_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich venice)
      (venice_count_1)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (at_city zurich))
      (at_city venice)
      (not (venice_count_1))
      (venice_count_2)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_venice_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich venice)
      (venice_count_2)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (at_city zurich))
      (at_city venice)
      (not (venice_count_2))
      (venice_count_3)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_venice_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich venice)
      (venice_count_3)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (at_city zurich))
      (at_city venice)
      (not (venice_count_3))
      (venice_count_4)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_venice_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich venice)
      (venice_count_4)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (at_city zurich))
      (at_city venice)
      (not (venice_count_4))
      (venice_count_5)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_venice_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich venice)
      (venice_count_5)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d venice)
      (not (at_city zurich))
      (at_city venice)
      (not (venice_count_5))
      (venice_count_6)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_florence_0
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich florence)
      (florence_count_0)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (at_city zurich))
      (at_city florence)
      (not (florence_count_0))
      (florence_count_1)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_florence_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich florence)
      (florence_count_1)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (at_city zurich))
      (at_city florence)
      (not (florence_count_1))
      (florence_count_2)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_florence_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich florence)
      (florence_count_2)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (at_city zurich))
      (at_city florence)
      (not (florence_count_2))
      (florence_count_3)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_florence_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich florence)
      (florence_count_3)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (at_city zurich))
      (at_city florence)
      (not (florence_count_3))
      (florence_count_4)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_florence_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich florence)
      (florence_count_4)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (at_city zurich))
      (at_city florence)
      (not (florence_count_4))
      (florence_count_5)
      (not (current_day ?d))
    )
  )

  (:action assign_fly_zurich_to_florence_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at_city zurich)
      (direct zurich florence)
      (florence_count_5)
      (not (trip_done))
    )
    :effect (and
      (assigned ?d florence)
      (not (at_city zurich))
      (at_city florence)
      (not (florence_count_5))
      (florence_count_6)
      (not (current_day ?d))
    )
  )
)
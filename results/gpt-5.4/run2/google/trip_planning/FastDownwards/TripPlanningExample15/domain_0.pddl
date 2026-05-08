(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (start_pending)
  )

  (:action choose_start_berlin
    :parameters ()
    :precondition (start_pending)
    :effect (and
      (not (start_pending))
      (current_day day1)
      (at berlin day1)
    )
  )

  (:action choose_start_porto
    :parameters ()
    :precondition (start_pending)
    :effect (and
      (not (start_pending))
      (current_day day1)
      (at porto day1)
    )
  )

  (:action choose_start_krakow
    :parameters ()
    :precondition (start_pending)
    :effect (and
      (not (start_pending))
      (current_day day1)
      (at krakow day1)
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (not (at berlin ?d2))
      (not (at porto ?d2))
      (not (at krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly_berlin_to_porto
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at berlin ?d1)
      (direct_flight berlin porto)
      (not (at berlin ?d2))
      (not (at porto ?d2))
      (not (at krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at porto ?d2)
    )
  )

  (:action fly_porto_to_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at porto ?d1)
      (direct_flight porto berlin)
      (not (at berlin ?d2))
      (not (at porto ?d2))
      (not (at krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at berlin ?d2)
    )
  )

  (:action fly_berlin_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at berlin ?d1)
      (direct_flight berlin krakow)
      (not (at berlin ?d2))
      (not (at porto ?d2))
      (not (at krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at krakow ?d2)
    )
  )

  (:action fly_krakow_to_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow ?d1)
      (direct_flight krakow berlin)
      (not (at berlin ?d2))
      (not (at porto ?d2))
      (not (at krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at berlin ?d2)
    )
  )
)
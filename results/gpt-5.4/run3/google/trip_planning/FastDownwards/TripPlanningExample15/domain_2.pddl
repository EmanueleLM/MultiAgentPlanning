(define (domain trip_planning_example15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_berlin ?d - day)
    (visited_porto ?d - day)
    (visited_krakow ?d - day)
    (porto_wedding_window ?d - day)
  )

  (:action start_in_berlin
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at berlin))
      (not (at porto))
      (not (at krakow))
    )
    :effect (and
      (at berlin)
      (visited_berlin day_1)
    )
  )

  (:action start_in_porto
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at berlin))
      (not (at porto))
      (not (at krakow))
    )
    :effect (and
      (at porto)
      (visited_porto day_1)
    )
  )

  (:action start_in_krakow
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at berlin))
      (not (at porto))
      (not (at krakow))
    )
    :effect (and
      (at krakow)
      (visited_krakow day_1)
    )
  )

  (:action stay_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at berlin)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_berlin ?d2)
    )
  )

  (:action stay_porto
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at porto)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_porto ?d2)
    )
  )

  (:action stay_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_krakow ?d2)
    )
  )

  (:action fly_berlin_to_porto
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at berlin)
      (connected berlin porto)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at berlin))
      (at porto)
      (visited_porto ?d2)
    )
  )

  (:action fly_porto_to_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at porto)
      (connected porto berlin)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at porto))
      (at berlin)
      (visited_berlin ?d2)
    )
  )

  (:action fly_berlin_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at berlin)
      (connected berlin krakow)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at berlin))
      (at krakow)
      (visited_krakow ?d2)
    )
  )

  (:action fly_krakow_to_berlin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (connected krakow berlin)
      (not (visited_berlin ?d2))
      (not (visited_porto ?d2))
      (not (visited_krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at krakow))
      (at berlin)
      (visited_berlin ?d2)
    )
  )
)
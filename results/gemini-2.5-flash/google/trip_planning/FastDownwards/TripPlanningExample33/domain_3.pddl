(define (domain trip-planning-example33)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    krakow_stay_counter
    rome_stay_counter
    barcelona_stay_counter
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (has_flight ?c1 - city ?c2 - city)
    (has_krakow_stay_count ?kc - krakow_stay_counter)
    (next_krakow_stay ?kc1 - krakow_stay_counter ?kc2 - krakow_stay_counter)
    (has_rome_stay_count ?rc - rome_stay_counter)
    (next_rome_stay ?rc1 - rome_stay_counter ?rc2 - rome_stay_counter)
    (has_barcelona_stay_count ?bc - barcelona_stay_counter)
    (next_barcelona_stay ?bc1 - barcelona_stay_counter ?bc2 - barcelona_stay_counter)
    (friend_met)
    (can_meet_friend_on_day ?d - day)
  )

  (:action travel
    :parameters (?from_c - city ?to_c - city ?curr_d - day ?next_d - day)
    :precondition (and
      (at ?from_c)
      (current_day ?curr_d)
      (next_day ?curr_d ?next_d)
      (has_flight ?from_c ?to_c)
    )
    :effect (and
      (not (at ?from_c))
      (at ?to_c)
      (not (current_day ?curr_d))
      (current_day ?next_d)
    )
  )

  (:action stay_in_krakow
    :parameters (?curr_d - day ?next_d - day ?curr_kc - krakow_stay_counter ?next_kc - krakow_stay_counter)
    :precondition (and
      (at krakow)
      (current_day ?curr_d)
      (next_day ?curr_d ?next_d)
      (has_krakow_stay_count ?curr_kc)
      (next_krakow_stay ?curr_kc ?next_kc)
    )
    :effect (and
      (not (current_day ?curr_d))
      (current_day ?next_d)
      (not (has_krakow_stay_count ?curr_kc))
      (has_krakow_stay_count ?next_kc)
    )
  )

  (:action stay_in_rome
    :parameters (?curr_d - day ?next_d - day ?curr_rc - rome_stay_counter ?next_rc - rome_stay_counter)
    :precondition (and
      (at rome)
      (current_day ?curr_d)
      (next_day ?curr_d ?next_d)
      (has_rome_stay_count ?curr_rc)
      (next_rome_stay ?curr_rc ?next_rc)
    )
    :effect (and
      (not (current_day ?curr_d))
      (current_day ?next_d)
      (not (has_rome_stay_count ?curr_rc))
      (has_rome_stay_count ?next_rc)
    )
  )

  (:action stay_in_barcelona
    :parameters (?curr_d - day ?next_d - day ?curr_bc - barcelona_stay_counter ?next_bc - barcelona_stay_counter)
    :precondition (and
      (at barcelona)
      (current_day ?curr_d)
      (next_day ?curr_d ?next_d)
      (has_barcelona_stay_count ?curr_bc)
      (next_barcelona_stay ?curr_bc ?next_bc)
    )
    :effect (and
      (not (current_day ?curr_d))
      (current_day ?next_d)
      (not (has_barcelona_stay_count ?curr_bc))
      (has_barcelona_stay_count ?next_bc)
    )
  )

  (:action meet_friend_in_krakow
    :parameters (?curr_d - day)
    :precondition (and
      (at krakow)
      (current_day ?curr_d)
      (can_meet_friend_on_day ?curr_d)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)
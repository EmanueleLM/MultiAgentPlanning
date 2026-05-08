(define (domain trip-planning-example33)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    day_count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (has_flight ?c1 - city ?c2 - city)
    (days_spent_in ?c - city ?dc - day_count)
    (next_day_count ?dc1 - day_count ?dc2 - day_count)
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

  (:action stay
    :parameters (?c - city ?curr_d - day ?next_d - day ?curr_dc - day_count ?next_dc - day_count)
    :precondition (and
      (at ?c)
      (current_day ?curr_d)
      (next_day ?curr_d ?next_d)
      (days_spent_in ?c ?curr_dc)
      (next_day_count ?curr_dc ?next_dc)
    )
    :effect (and
      (not (current_day ?curr_d))
      (current_day ?next_d)
      (not (days_spent_in ?c ?curr_dc))
      (days_spent_in ?c ?next_dc)
    )
  )

  (:action meet_friend_and_stay_in_krakow
    :parameters (?curr_d - day ?next_d - day ?curr_dc - day_count ?next_dc - day_count)
    :precondition (and
      (at krakow)
      (current_day ?curr_d)
      (next_day ?curr_d ?next_d)
      (can_meet_friend_on_day ?curr_d)
      (not (friend_met))
      (days_spent_in krakow ?curr_dc)
      (next_day_count ?curr_dc ?next_dc)
    )
    :effect (and
      (friend_met)
      (not (current_day ?curr_d))
      (current_day ?next_d)
      (not (days_spent_in krakow ?curr_dc))
      (days_spent_in krakow ?next_dc)
    )
  )
)
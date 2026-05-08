(define (domain trip_planning_example_34)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day_step count_level)

  (:predicates
    (is_at_city ?c - city)
    (current_day ?d - day_step)
    (has_stay_count ?c - city ?l - count_level)
    (day_at ?d - day_step ?c - city)
    (next_day ?d1 ?d2 - day_step)
    (next_count ?l1 ?l2 - count_level)
    (connected ?c1 ?c2 - city)
    (trip_not_started)
  )

  (:action select_start_city
    :parameters (?c - city)
    :precondition (trip_not_started)
    :effect (and (not (trip_not_started)) (is_at_city ?c))
  )

  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (is_at_city ?from) (connected ?from ?to))
    :effect (and (not (is_at_city ?from)) (is_at_city ?to))
  )

  (:action stay
    :parameters (?c - city ?d - day_step ?nd - day_step ?l - count_level ?nl - count_level)
    :precondition (and 
      (is_at_city ?c) 
      (current_day ?d) 
      (next_day ?d ?nd) 
      (has_stay_count ?c ?l) 
      (next_count ?l ?nl)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd) 
      (not (has_stay_count ?c ?l)) 
      (has_stay_count ?c ?nl) 
      (day_at ?d ?c)
    )
  )
)
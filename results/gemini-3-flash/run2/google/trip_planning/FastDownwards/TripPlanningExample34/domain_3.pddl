(define (domain trip_planning_example_34)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day level)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (stay_count ?c - city ?l - level)
    (next_day_link ?d1 ?d2 - day)
    (next_level ?l1 ?l2 - level)
    (connected ?c1 ?c2 - city)
    (trip_not_started)
  )

  (:action select_start_city
    :parameters (?c - city)
    :precondition (trip_not_started)
    :effect (and (not (trip_not_started)) (at_city ?c))
  )

  (:action spend_time
    :parameters (?c - city ?d - day ?l - level ?nl - level)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (stay_count ?c ?l) 
      (next_level ?l ?nl) 
      (not (visited ?c ?d))
    )
    :effect (and 
      (visited ?c ?d) 
      (not (stay_count ?c ?l)) 
      (stay_count ?c ?nl)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d - day)
    :precondition (and 
      (at_city ?from) 
      (current_day ?d) 
      (connected ?from ?to)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to)
    )
  )

  (:action advance_day
    :parameters (?d ?nd - day)
    :precondition (and 
      (current_day ?d) 
      (next_day_link ?d ?nd)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd)
    )
  )
)
(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (count ?c - city ?v - count)
    (visited_on ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_val ?v1 ?v2 - count)
    (flight ?c1 ?c2 - city)
    (not_started)
  )

  (:action start_trip
    :parameters (?city - city ?d0 - day ?d1 - day ?c0 - count ?c1 - count)
    :precondition (and 
      (not_started) 
      (next_day ?d0 ?d1) 
      (next_val ?c0 ?c1) 
      (count ?city ?c0)
    )
    :effect (and 
      (not (not_started)) 
      (at_city ?city) 
      (current_day ?d1) 
      (not (count ?city ?c0)) 
      (count ?city ?c1) 
      (visited_on ?city ?d1)
    )
  )

  (:action stay
    :parameters (?city - city ?d_pre - day ?d_curr - day ?c_pre - count ?c_curr - count)
    :precondition (and 
      (at_city ?city) 
      (current_day ?d_pre) 
      (next_day ?d_pre ?d_curr) 
      (next_val ?c_pre ?c_curr) 
      (count ?city ?c_pre)
    )
    :effect (and 
      (not (current_day ?d_pre)) 
      (current_day ?d_curr) 
      (not (count ?city ?c_pre)) 
      (count ?city ?c_curr) 
      (visited_on ?city ?d_curr)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_pre - day ?d_curr - day ?c1_pre - count ?c1_curr - count ?c2_pre - count ?c2_curr - count)
    :precondition (and 
      (at_city ?from) 
      (flight ?from ?to) 
      (current_day ?d_pre) 
      (next_day ?d_pre ?d_curr) 
      (next_val ?c1_pre ?c1_curr) 
      (count ?from ?c1_pre) 
      (next_val ?c2_pre ?c2_curr) 
      (count ?to ?c2_pre)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (not (current_day ?d_pre)) 
      (current_day ?d_curr) 
      (not (count ?from ?c1_pre)) 
      (count ?from ?c1_curr) 
      (not (count ?to ?c2_pre)) 
      (count ?to ?c2_curr) 
      (visited_on ?from ?d_curr) 
      (visited_on ?to ?d_curr)
    )
  )
)
(define (domain travel_domain)
  (:requirements :strips :typing)
  (:types city day amount)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?a - amount)
    (can_fly ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_amount ?a1 - amount ?a2 - amount)
    (is_friend_window ?d - day)
    (met_friend)
  )

  ;; The agent starts the trip by arriving at the first city on Day 1.
  (:action arrive
    :parameters (?to - city ?d_start - day ?d_first - day ?c_zero - amount ?c_one - amount)
    :precondition (and 
      (at_city origin) 
      (current_day ?d_start) 
      (next_day ?d_start ?d_first)
      (visit_count ?to ?c_zero) 
      (next_amount ?c_zero ?c_one)
    )
    :effect (and 
      (not (at_city origin)) 
      (at_city ?to)
      (not (current_day ?d_start)) 
      (current_day ?d_first)
      (not (visit_count ?to ?c_zero)) 
      (visit_count ?to ?c_one)
    )
  )

  ;; The agent spends a full day in their current city.
  (:action stay
    :parameters (?c - city ?d_prev - day ?d_curr - day ?c_prev - amount ?c_curr - amount)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d_prev) 
      (next_day ?d_prev ?d_curr)
      (visit_count ?c ?c_prev) 
      (next_amount ?c_prev ?c_curr)
    )
    :effect (and 
      (not (current_day ?d_prev)) 
      (current_day ?d_curr)
      (not (visit_count ?c ?c_prev)) 
      (visit_count ?c ?c_curr)
    )
  )

  ;; The agent takes a direct flight to a new city, spending that day at the destination.
  (:action fly
    :parameters (?from - city ?to - city ?d_prev - day ?d_curr - day ?c_prev - amount ?c_curr - amount)
    :precondition (and 
      (at_city ?from) 
      (can_fly ?from ?to) 
      (current_day ?d_prev) 
      (next_day ?d_prev ?d_curr)
      (visit_count ?to ?c_prev) 
      (next_amount ?c_prev ?c_curr)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to)
      (not (current_day ?d_prev)) 
      (current_day ?d_curr)
      (not (visit_count ?to ?c_prev)) 
      (visit_count ?to ?c_curr)
    )
  )

  ;; Meeting a friend in Florence can occur if the agent is in Florence during the specified day window.
  (:action meet_friend
    :parameters (?d - day)
    :precondition (and 
      (at_city florence) 
      (current_day ?d) 
      (is_friend_window ?d)
    )
    :effect (met_friend)
  )
)
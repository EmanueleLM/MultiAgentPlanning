(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (day_count ?c - city ?v - count)
    (next_day ?d1 ?d2 - day)
    (next_val ?v1 ?v2 - count)
    (can_fly ?c1 ?c2 - city)
    (met_friend)
    (is_friend_window ?d - day)
    (trip_started)
  )

  ;; Choose the starting city for the trip on Day 1.
  (:action start_trip
    :parameters (?c - city)
    :precondition (not (trip_started))
    :effect (and 
      (trip_started) 
      (at_city ?c) 
      (current_day d1) 
      (not (day_count ?c v0))
      (day_count ?c v1)
    )
  )

  ;; Spend a day in the current city, incrementing its visit count and the current day.
  (:action stay
    :parameters (?c - city ?d_prev - day ?d_curr - day ?v_prev - count ?v_curr - count)
    :precondition (and 
      (trip_started)
      (at_city ?c) 
      (current_day ?d_prev) 
      (next_day ?d_prev ?d_curr) 
      (day_count ?c ?v_prev) 
      (next_val ?v_prev ?v_curr)
    )
    :effect (and 
      (not (current_day ?d_prev)) 
      (current_day ?d_curr) 
      (not (day_count ?c ?v_prev)) 
      (day_count ?c ?v_curr)
    )
  )

  ;; Commute to a new city. The day of the flight counts toward the duration of both 
  ;; the origin city (last day there) and the destination city (first day there).
  (:action fly
    :parameters (?from - city ?to - city ?d_prev - day ?d_curr - day ?v_f_old - count ?v_f_new - count ?v_t_old - count ?v_t_new - count)
    :precondition (and 
      (trip_started)
      (at_city ?from) 
      (can_fly ?from ?to) 
      (current_day ?d_prev) 
      (next_day ?d_prev ?d_curr) 
      (day_count ?from ?v_f_old) 
      (next_val ?v_f_old ?v_f_new) 
      (day_count ?to ?v_t_old) 
      (next_val ?v_t_old ?v_t_new)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (not (current_day ?d_prev)) 
      (current_day ?d_curr) 
      (not (day_count ?from ?v_f_old)) 
      (day_count ?from ?v_f_new) 
      (not (day_count ?to ?v_t_old)) 
      (day_count ?to ?v_t_new)
    )
  )

  ;; Meet a friend in Florence if the agent is there during the allowed window.
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
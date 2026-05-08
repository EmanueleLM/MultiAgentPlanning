(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (can_fly ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?c1 - count ?c2 - count)
    (spent ?city - city ?count - count)
    (logged ?city - city ?day - day)
    (friend_met)
    (is_friend_window ?d - day)
    (is_tallinn ?c - city)
    (not_started)
    (trip_finished)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and (not (not_started)) (at ?c d1))
  )

  (:action log_visit
    :parameters (?c - city ?d - day ?curr - count ?next - count)
    :precondition (and (at ?c ?d) (spent ?c ?curr) (next_count ?curr ?next) (not (logged ?c ?d)))
    :effect (and (not (spent ?c ?curr)) (spent ?c ?next) (logged ?c ?d))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (can_fly ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  (:action meet_friend
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_tallinn ?c) (is_friend_window ?d))
    :effect (friend_met)
  )

  (:action finish_trip
    :parameters (?c - city)
    :precondition (at ?c d15)
    :effect (trip_finished)
  )
)
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
    (is_start_day ?d - day)
    (is_end_day ?d - day)
  )

  ;; Initialize the trip by choosing an initial city on Day 1.
  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not_started) (is_start_day ?d))
    :effect (and (not (not_started)) (at ?c ?d))
  )

  ;; Record that a specific day counts towards a city's total visit duration.
  ;; This can be done while present in the city on that day.
  (:action log_visit
    :parameters (?c - city ?d - day ?curr - count ?next - count)
    :precondition (and (at ?c ?d) (spent ?c ?curr) (next_count ?curr ?next) (not (logged ?c ?d)))
    :effect (and (not (spent ?c ?curr)) (spent ?c ?next) (logged ?c ?d))
  )

  ;; Fly between two cities on the same day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (can_fly ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  ;; Move to the next day while staying in the same city.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  ;; Meet a friend in Tallinn during the specified window.
  (:action meet_friend
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_tallinn ?c) (is_friend_window ?d))
    :effect (friend_met)
  )

  ;; Finalize the trip on the last day.
  (:action finish_trip
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_end_day ?d))
    :effect (trip_finished)
  )
)
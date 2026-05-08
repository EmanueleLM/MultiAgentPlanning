(define (domain trip_planning_14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day_succ ?d1 - day ?d2 - day)           ; successor relation between days
    (at ?c - city ?d - day)                  ; located in city on a given day
    (assigned ?d - day)                      ; day has been assigned a city (prevents double assignment)
    (direct_flight ?from - city ?to - city)  ; allowed direct flight connectivity
    (florence_window ?d - day)               ; days that satisfy Florence meeting window
    (is_florence ?c - city)
    (is_barcelona ?c - city)
    (is_helsinki ?c - city)
    (first_day ?d - day)
    (florence_met)                           ; becomes true once some Florence-window day is assigned to Florence
  )

  ;; First-day assignment actions (separate per city to keep preconditions STRIPS-compatible)
  (:action assign_first_barcelona
    :parameters (?c - city ?d - day)
    :precondition (and (is_barcelona ?c) (first_day ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?c ?d))
  )

  (:action assign_first_helsinki
    :parameters (?c - city ?d - day)
    :precondition (and (is_helsinki ?c) (first_day ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?c ?d))
  )

  (:action assign_first_florence_nonwindow
    :parameters (?c - city ?d - day)
    :precondition (and (is_florence ?c) (first_day ?d) (not (florence_window ?d)) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?c ?d))
  )

  (:action assign_first_florence_window
    :parameters (?c - city ?d - day)
    :precondition (and (is_florence ?c) (first_day ?d) (florence_window ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?c ?d) (florence_met))
  )

  ;; Stay-in-city actions from one day to its successor (Florence split to mark meeting when on a window day)
  (:action stay_in_barcelona
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?c ?d1) (is_barcelona ?c) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?c ?d2))
  )

  (:action stay_in_helsinki
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?c ?d1) (is_helsinki ?c) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?c ?d2))
  )

  (:action stay_in_florence_nonwindow
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?c ?d1) (is_florence ?c) (not (florence_window ?d2)) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?c ?d2))
  )

  (:action stay_in_florence_window
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?c ?d1) (is_florence ?c) (florence_window ?d2) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?c ?d2) (florence_met))
  )

  ;; Flights between cities: only allowed when a direct_flight fact exists.
  ;; Arrivals to Florence on window days set the meeting predicate.
  (:action fly_to_barcelona
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?from ?d1) (direct_flight ?from ?to) (is_barcelona ?to) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?to ?d2))
  )

  (:action fly_to_helsinki
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?from ?d1) (direct_flight ?from ?to) (is_helsinki ?to) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?to ?d2))
  )

  (:action fly_to_florence_nonwindow
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?from ?d1) (direct_flight ?from ?to) (is_florence ?to) (not (florence_window ?d2)) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?to ?d2))
  )

  (:action fly_to_florence_window
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (day_succ ?d1 ?d2) (at ?from ?d1) (direct_flight ?from ?to) (is_florence ?to) (florence_window ?d2) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?to ?d2) (florence_met))
  )
)
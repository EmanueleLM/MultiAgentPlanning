(define (domain trip_planning_14days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (day_succ ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (direct_flight ?from - city ?to - city)
    (florence_window ?d - day)
    (is_florence ?c - city)
    (is_barcelona ?c - city)
    (is_helsinki ?c - city)
    (first_day ?d - day)
    (florence_met)
  )

  ;; First-day assignment actions (one per city; Florence split to mark meeting when starting on a window day)
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

  ;; Stay actions (propagate being in the same city from day d1 to its successor d2)
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

  ;; Flights between cities: generic flight actions guarded by direct_flight.
  ;; Arrival in Florence on a window day sets the meeting predicate.
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
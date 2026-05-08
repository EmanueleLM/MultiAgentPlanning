(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (count_stockholm ?n - count)
    (count_athens ?n - count)
    (count_mykonos ?n - count)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (is_day_1 ?d - day)
    (is_day_6 ?d - day)
  )

  ;; Action to move between cities without consuming a day.
  ;; Flying is only possible between connected cities.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at_city ?from) (can_fly ?from ?to))
    :effect (and (not (at_city ?from)) (at_city ?to))
  )

  ;; Action to spend a day in Stockholm.
  ;; Required to be in Stockholm on Day 1 and Day 6 for the conference.
  (:action stay_stockholm
    :parameters (?d - day ?next_d - day ?n - count ?next_n - count)
    :precondition (and (current_day ?d) (next_day ?d ?next_d)
                       (at_city stockholm)
                       (count_stockholm ?n) (next_count ?n ?next_n))
    :effect (and (not (current_day ?d)) (current_day ?next_d)
                 (not (count_stockholm ?n)) (count_stockholm ?next_n))
  )

  ;; Action to spend a day in Athens.
  ;; Forbidden on Day 1 and Day 6 due to the conference in Stockholm.
  (:action stay_athens
    :parameters (?d - day ?next_d - day ?n - count ?next_n - count)
    :precondition (and (current_day ?d) (next_day ?d ?next_d)
                       (at_city athens)
                       (count_athens ?n) (next_count ?n ?next_n)
                       (not (is_day_1 ?d)) (not (is_day_6 ?d)))
    :effect (and (not (current_day ?d)) (current_day ?next_d)
                 (not (count_athens ?n)) (count_athens ?next_n))
  )

  ;; Action to spend a day in Mykonos.
  ;; Forbidden on Day 1 and Day 6 due to the conference in Stockholm.
  (:action stay_mykonos
    :parameters (?d - day ?next_d - day ?n - count ?next_n - count)
    :precondition (and (current_day ?d) (next_day ?d ?next_d)
                       (at_city mykonos)
                       (count_mykonos ?n) (next_count ?n ?next_n)
                       (not (is_day_1 ?d)) (not (is_day_6 ?d)))
    :effect (and (not (current_day ?d)) (current_day ?next_d)
                 (not (count_mykonos ?n)) (count_mykonos ?next_n))
  )
)
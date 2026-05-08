(define (domain trip_planning_example_10)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (count_at ?c - city ?n - count)
    (next_count ?n1 - count ?n2 - count)
    (already_counted ?c - city ?d - day)
  )

  ;; Move time forward, staying in the same city.
  (:action advance_day
    :parameters (?d - day ?next_d - day ?c - city)
    :precondition (and (current_day ?d) (at ?c ?d) (next_day ?d ?next_d))
    :effect (and (not (current_day ?d)) (current_day ?next_d) (at ?c ?next_d))
  )

  ;; Move between cities on the current day via direct flight.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (current_day ?d) (at ?from ?d) (flight ?from ?to))
    :effect (and (at ?to ?d) (not (at ?from ?d)))
  )

  ;; Record that the current day counts toward the stay duration in a city.
  (:action count_visit
    :parameters (?c - city ?d - day ?c_curr - count ?c_next - count)
    :precondition (and (at ?c ?d) (current_day ?d) (count_at ?c ?c_curr) (next_count ?c_curr ?c_next) (not (already_counted ?c ?d)))
    :effect (and (not (count_at ?c ?c_curr)) (count_at ?c ?c_next) (already_counted ?c ?d))
  )
)
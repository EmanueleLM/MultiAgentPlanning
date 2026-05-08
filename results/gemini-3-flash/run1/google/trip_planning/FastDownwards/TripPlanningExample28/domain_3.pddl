(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (flight ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (not_started)
  )

  ;; pick_start: Select the first city of the trip.
  ;; This action does not consume a day; the first day is counted by the first stay or fly action.
  (:action pick_start
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at_city ?c)
    )
  )

  ;; stay: Spend a full day in the current city.
  ;; Increments the clock and the visit count for that city.
  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d)
      (next_day ?d ?dn)
      (visit_count ?c ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (not (visit_count ?c ?n))
      (visit_count ?c ?nn)
    )
  )

  ;; fly: Travel between cities. 
  ;; The travel day is considered a visit day for both the departure and arrival cities.
  ;; Increments the clock and the visit count for both cities involved.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day ?n_from - count ?nn_from - count ?n_to - count ?nn_to - count)
    :precondition (and
      (at_city ?from)
      (flight ?from ?to)
      (current_day ?d)
      (next_day ?d ?dn)
      (visit_count ?from ?n_from)
      (next_count ?n_from ?nn_from)
      (visit_count ?to ?n_to)
      (next_count ?n_to ?nn_to)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d))
      (current_day ?dn)
      (not (visit_count ?from ?n_from))
      (visit_count ?from ?nn_from)
      (not (visit_count ?to ?n_to))
      (visit_count ?to ?nn_to)
    )
  )
)
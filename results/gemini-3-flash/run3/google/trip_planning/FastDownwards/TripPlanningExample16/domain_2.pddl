(define (domain trip_planning_example_16)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Stay in the same city and move to the next calendar day.
  ;; This action increments the stay count for that city and marks the day as visited.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (city_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (at ?c ?d_next)
      (visited ?c ?d_next)
      (city_count ?c ?n_next)
      (not (at ?c ?d_curr))
      (not (city_count ?c ?n_curr))
    )
  )

  ;; Commute to a new city on the same day.
  ;; This action allows a single calendar day to be shared between the departure and arrival cities.
  ;; It increments the stay count for the destination city and marks that day as visited for it.
  (:action fly
    :parameters (?from - city ?to - city ?day - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?from ?day)
      (flight ?from ?to)
      (city_count ?to ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (at ?to ?day)
      (visited ?to ?day)
      (city_count ?to ?n_next)
      (not (at ?from ?day))
      (not (city_count ?to ?n_curr))
    )
  )
)
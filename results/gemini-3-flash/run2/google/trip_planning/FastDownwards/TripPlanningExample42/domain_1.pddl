(define (domain trip_planning_example_42)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at_start ?c - city ?d - day)
    (day_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (has_flight ?c1 - city ?c2 - city)
    (visited ?c - city ?d - day)
    (trip_ended)
  )

  ;; Stay in the current city for the day.
  ;; Increases the day counter and the stay counter for that city.
  (:action stay
    :parameters (?c - city ?d - day ?next_d - day ?c_old - count ?c_new - count)
    :precondition (and 
      (at_start ?c ?d)
      (next_day ?d ?next_d)
      (day_count ?c ?c_old)
      (next_count ?c_old ?c_new)
    )
    :effect (and 
      (not (at_start ?c ?d))
      (at_start ?c ?next_d)
      (not (day_count ?c ?c_old))
      (day_count ?c ?c_new)
      (visited ?c ?d)
    )
  )

  ;; Fly from one city to another.
  ;; The flight day counts as a stay day for BOTH the departure and arrival cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?next_d - day ?c_from_old ?c_from_new - count ?c_to_old ?c_to_new - count)
    :precondition (and 
      (at_start ?from ?d)
      (next_day ?d ?next_d)
      (has_flight ?from ?to)
      (day_count ?from ?c_from_old)
      (next_count ?c_from_old ?c_from_new)
      (day_count ?to ?c_to_old)
      (next_count ?c_to_old ?c_to_new)
    )
    :effect (and 
      (not (at_start ?from ?d))
      (at_start ?to ?next_d)
      (not (day_count ?from ?c_from_old))
      (day_count ?from ?c_from_new)
      (not (day_count ?to ?c_to_old))
      (day_count ?to ?c_to_new)
      (visited ?from ?d)
      (visited ?to ?d)
    )
  )

  ;; Finalize the trip after all 11 days are accounted for.
  (:action end_trip
    :parameters (?c - city)
    :precondition (at_start ?c d_end)
    :effect (trip_ended)
  )
)
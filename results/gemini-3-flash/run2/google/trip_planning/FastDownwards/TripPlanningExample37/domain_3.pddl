(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
    (is_day_one ?d - day)
  )

  ;; Start the trip on day 1 at a chosen city.
  (:action start_trip
    :parameters (?c - city ?d - day ?n1 - count)
    :precondition (and 
      (not (started))
      (is_day_one ?d)
      (next_count n0 ?n1)
    )
    :effect (and 
      (started)
      (at ?c ?d)
      (visited ?c ?d)
      (visit_count ?c ?n1)
    )
  )

  ;; Stay in the current city and move to the next day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (started)
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (visit_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at ?c ?d_curr))
      (at ?c ?d_next)
      (visited ?c ?d_next)
      (not (visit_count ?c ?n_curr))
      (visit_count ?c ?n_next)
    )
  )

  ;; Fly to a different city on the same day.
  ;; This counts both cities for that day (travel overlap).
  (:action fly
    :parameters (?c_from ?c_to - city ?d - day ?n_to_curr ?n_to_next - count)
    :precondition (and 
      (started)
      (at ?c_from ?d)
      (can_fly ?c_from ?c_to)
      (not (visited ?c_to ?d))
      (visit_count ?c_to ?n_to_curr)
      (next_count ?n_to_curr ?n_to_next)
    )
    :effect (and 
      (not (at ?c_from ?d))
      (at ?c_to ?d)
      (visited ?c_to ?d)
      (not (visit_count ?c_to ?n_to_curr))
      (visit_count ?c_to ?n_to_next)
    )
  )
)
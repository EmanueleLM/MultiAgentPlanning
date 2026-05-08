(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
    (is_day_one ?d - day)
  )

  ;; Initialize the trip on the first day at any city.
  (:action start_trip
    :parameters (?c - city ?d - day ?n0 ?n1 - count)
    :precondition (and 
      (not (started))
      (is_day_one ?d)
      (visit_count ?c ?n0)
      (next_count ?n0 ?n1)
    )
    :effect (and 
      (started)
      (at ?c ?d)
      (current_day ?d)
      (not (visit_count ?c ?n0))
      (visit_count ?c ?n1)
    )
  )

  ;; Spend the next day in the same city.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (started)
      (at ?c ?d_curr)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (visit_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (at ?c ?d_next)
      (not (visit_count ?c ?n_curr))
      (visit_count ?c ?n_next)
    )
  )

  ;; Commute to a different city via a direct flight for the next day.
  (:action fly
    :parameters (?c_from ?c_to - city ?d_curr ?d_next - day ?n_to_curr ?n_to_next - count)
    :precondition (and 
      (started)
      (at ?c_from ?d_curr)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (can_fly ?c_from ?c_to)
      (visit_count ?c_to ?n_to_curr)
      (next_count ?n_to_curr ?n_to_next)
    )
    :effect (and 
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (at ?c_to ?d_next)
      (not (visit_count ?c_to ?n_to_curr))
      (visit_count ?c_to ?n_to_next)
    )
  )
)
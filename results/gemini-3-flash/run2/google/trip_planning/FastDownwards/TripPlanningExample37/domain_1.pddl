(define (domain trip_planning_example_37)
  (:requirements :strips :typing)
  (:types city day num)
  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited_count ?c - city ?n - num)
    (next_day ?d1 ?d2 - day)
    (next_num ?n1 ?n2 - num)
    (flight ?c1 ?c2 - city)
    (trip_started)
  )

  ;; Initialize the trip on day_1 at any city.
  (:action start_trip
    :parameters (?c - city ?n0 ?n1 - num)
    :precondition (and 
      (not (trip_started))
      (visited_count ?c ?n0)
      (next_num ?n0 ?n1)
    )
    :effect (and 
      (trip_started)
      (at ?c day_1)
      (current_day day_1)
      (not (visited_count ?c ?n0))
      (visited_count ?c ?n1)
    )
  )

  ;; Stay in the same city for the next day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - num)
    :precondition (and 
      (trip_started)
      (at ?c ?d_curr)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (visited_count ?c ?n_curr)
      (next_num ?n_curr ?n_next)
    )
    :effect (and 
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (at ?c ?d_next)
      (not (visited_count ?c ?n_curr))
      (visited_count ?c ?n_next)
    )
  )

  ;; Fly to a different city for the next day.
  (:action fly
    :parameters (?c_from ?c_to - city ?d_curr ?d_next - day ?n_curr ?n_next - num)
    :precondition (and 
      (trip_started)
      (at ?c_from ?d_curr)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (flight ?c_from ?c_to)
      (visited_count ?c_to ?n_curr)
      (next_num ?n_curr ?n_next)
    )
    :effect (and 
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (at ?c_to ?d_next)
      (not (visited_count ?c_to ?n_curr))
      (visited_count ?c_to ?n_next)
    )
  )
)
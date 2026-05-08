(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (visited_day ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight_connection ?c1 ?c2 - city)
    (ready_to_start)
  )

  ;; Start the trip in any city on Day 1
  (:action start_trip
    :parameters (?c - city)
    :precondition (ready_to_start)
    :effect (and 
      (not (ready_to_start)) 
      (at_city ?c)
    )
  )

  ;; Spend a day in the current city
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_old ?n_new - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next)
      (visit_count ?c ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (current_day ?d_curr)) 
      (current_day ?d_next)
      (not (visit_count ?c ?n_old)) 
      (visit_count ?c ?n_new)
      (visited_day ?c ?d_curr)
    )
  )

  ;; Fly to a new city during a day, counting that day for both the departure and arrival cities
  (:action fly
    :parameters (?c_from ?c_to - city ?d_curr ?d_next - day ?n_f_o ?n_f_n ?n_t_o ?n_t_n - count)
    :precondition (and 
      (at_city ?c_from)
      (flight_connection ?c_from ?c_to)
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next)
      (visit_count ?c_from ?n_f_o)
      (next_count ?n_f_o ?n_f_n)
      (visit_count ?c_to ?n_t_o)
      (next_count ?n_t_o ?n_t_n)
    )
    :effect (and 
      (not (at_city ?c_from))
      (at_city ?c_to)
      (not (current_day ?d_curr)) 
      (current_day ?d_next)
      (not (visit_count ?c_from ?n_f_o)) 
      (visit_count ?c_from ?n_f_n)
      (not (visit_count ?c_to ?n_t_o)) 
      (visit_count ?c_to ?n_t_n)
      (visited_day ?c_from ?d_curr)
      (visited_day ?c_to ?d_curr)
    )
  )
)
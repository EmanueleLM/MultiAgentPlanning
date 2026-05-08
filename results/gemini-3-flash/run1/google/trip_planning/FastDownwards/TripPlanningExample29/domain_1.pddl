(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at_city_day ?c - city ?d - day)
    (city_visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (ready_to_start)
    (is_day1 ?d - day)
  )

  ;; Action to start the trip on day 1 in a chosen city
  (:action start_trip
    :parameters (?c - city ?d1 - day ?n0 ?n1 - count)
    :precondition (and 
      (ready_to_start) 
      (is_day1 ?d1) 
      (city_visit_count ?c ?n0) 
      (next_count ?n0 ?n1)
    )
    :effect (and 
      (not (ready_to_start)) 
      (at_city_day ?c ?d1) 
      (city_visit_count ?c ?n1) 
      (not (city_visit_count ?c ?n0))
    )
  )

  ;; Action to spend another day in the same city
  (:action stay
    :parameters (?c - city ?d_from ?d_to - day ?n_from ?n_to - count)
    :precondition (and 
      (at_city_day ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (city_visit_count ?c ?n_from) 
      (next_count ?n_from ?n_to)
    )
    :effect (and 
      (at_city_day ?c ?d_to) 
      (not (at_city_day ?c ?d_from)) 
      (city_visit_count ?c ?n_to) 
      (not (city_visit_count ?c ?n_from))
    )
  )

  ;; Action to fly to a new city and spend that day there
  (:action fly
    :parameters (?c_from ?c_to - city ?d_from ?d_to - day ?n_from ?n_to - count)
    :precondition (and 
      (at_city_day ?c_from ?d_from) 
      (next_day ?d_from ?d_to) 
      (flight ?c_from ?c_to) 
      (city_visit_count ?c_to ?n_from) 
      (next_count ?n_from ?n_to)
    )
    :effect (and 
      (at_city_day ?c_to ?d_to) 
      (not (at_city_day ?c_from ?d_from)) 
      (city_visit_count ?c_to ?n_to) 
      (not (city_visit_count ?c_to ?n_from))
    )
  )
)